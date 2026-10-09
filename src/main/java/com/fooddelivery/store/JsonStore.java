package com.fooddelivery.store;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Minimal, dependency-free JSON-backed table store.
 * Persists records to /WEB-INF/data/<table>.json on the local filesystem
 * so the app works end-to-end without requiring an external database
 * to be installed/configured.
 *
 * Each record is a Map<String,String>. This is intentionally simple
 * (a hand-rolled JSON reader/writer) to avoid adding any external jar
 * dependencies to the build.
 */
public class JsonStore {

    private static final ReentrantLock LOCK = new ReentrantLock();
    private static String basePath = null;

    public static void init(String realDataPath) {
        basePath = realDataPath;
        new File(basePath).mkdirs();
    }

    private static File fileFor(String table) {
        return new File(basePath, table + ".json");
    }

    /** Read all records for a table. Returns empty list if file doesn't exist. */
    public static List<Map<String, String>> readAll(String table) {
        LOCK.lock();
        try {
            File f = fileFor(table);
            if (!f.exists()) return new ArrayList<>();
            String content = new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
            return parseArray(content);
        } catch (IOException e) {
            return new ArrayList<>();
        } finally {
            LOCK.unlock();
        }
    }

    /** Overwrite the table with this full list of records. */
    public static void writeAll(String table, List<Map<String, String>> records) {
        LOCK.lock();
        try {
            File f = fileFor(table);
            String json = toJsonArray(records);
            try (Writer w = new OutputStreamWriter(new FileOutputStream(f), StandardCharsets.UTF_8)) {
                w.write(json);
            }
        } catch (IOException e) {
            throw new RuntimeException("JsonStore write failed for " + table, e);
        } finally {
            LOCK.unlock();
        }
    }

    /** Append one record, auto-assigning an incrementing "id" field. */
    public static Map<String, String> insert(String table, Map<String, String> record) {
        LOCK.lock();
        try {
            List<Map<String, String>> all = readAll(table);
            int maxId = 0;
            for (Map<String, String> r : all) {
                try { maxId = Math.max(maxId, Integer.parseInt(r.getOrDefault("id", "0"))); }
                catch (NumberFormatException ignored) {}
            }
            record.put("id", String.valueOf(maxId + 1));
            all.add(record);
            writeAll(table, all);
            return record;
        } finally {
            LOCK.unlock();
        }
    }

    public static void update(String table, String id, Map<String, String> updated) {
        LOCK.lock();
        try {
            List<Map<String, String>> all = readAll(table);
            for (int i = 0; i < all.size(); i++) {
                if (id.equals(all.get(i).get("id"))) {
                    updated.put("id", id);
                    all.set(i, updated);
                    break;
                }
            }
            writeAll(table, all);
        } finally {
            LOCK.unlock();
        }
    }

    public static void delete(String table, String id) {
        LOCK.lock();
        try {
            List<Map<String, String>> all = readAll(table);
            all.removeIf(r -> id.equals(r.get("id")));
            writeAll(table, all);
        } finally {
            LOCK.unlock();
        }
    }

    public static Map<String, String> findById(String table, String id) {
        for (Map<String, String> r : readAll(table)) {
            if (id.equals(r.get("id"))) return r;
        }
        return null;
    }

    // ---------------- Tiny hand-rolled JSON (array-of-flat-objects only) ----------------

    private static String toJsonArray(List<Map<String, String>> records) {
        StringBuilder sb = new StringBuilder("[\n");
        for (int i = 0; i < records.size(); i++) {
            Map<String, String> r = records.get(i);
            sb.append("  {");
            int j = 0;
            for (Map.Entry<String, String> e : r.entrySet()) {
                if (j++ > 0) sb.append(", ");
                sb.append('"').append(escape(e.getKey())).append("\": \"")
                  .append(escape(e.getValue() == null ? "" : e.getValue())).append('"');
            }
            sb.append('}');
            if (i < records.size() - 1) sb.append(',');
            sb.append('\n');
        }
        sb.append(']');
        return sb.toString();
    }

    private static String escape(String s) {
        StringBuilder sb = new StringBuilder();
        for (char c : s.toCharArray()) {
            switch (c) {
                case '"': sb.append("\\\""); break;
                case '\\': sb.append("\\\\"); break;
                case '\n': sb.append("\\n"); break;
                case '\r': break;
                default: sb.append(c);
            }
        }
        return sb.toString();
    }

    private static List<Map<String, String>> parseArray(String json) {
        List<Map<String, String>> out = new ArrayList<>();
        int i = 0, n = json.length();
        while (i < n) {
            // find next '{'
            while (i < n && json.charAt(i) != '{') i++;
            if (i >= n) break;
            int objStart = i;
            int depth = 0;
            boolean inStr = false;
            for (; i < n; i++) {
                char c = json.charAt(i);
                if (c == '"' && (i == 0 || json.charAt(i - 1) != '\\')) inStr = !inStr;
                if (!inStr) {
                    if (c == '{') depth++;
                    else if (c == '}') {
                        depth--;
                        if (depth == 0) { i++; break; }
                    }
                }
            }
            String objStr = json.substring(objStart, i);
            out.add(parseObject(objStr));
        }
        return out;
    }

    private static Map<String, String> parseObject(String objStr) {
        Map<String, String> map = new LinkedHashMap<>();
        String body = objStr.trim();
        if (body.startsWith("{")) body = body.substring(1);
        if (body.endsWith("}")) body = body.substring(0, body.length() - 1);

        int i = 0, n = body.length();
        while (i < n) {
            while (i < n && (body.charAt(i) == ',' || Character.isWhitespace(body.charAt(i)))) i++;
            if (i >= n) break;
            // parse key (quoted)
            if (body.charAt(i) != '"') break;
            i++;
            StringBuilder key = new StringBuilder();
            while (i < n && body.charAt(i) != '"') {
                if (body.charAt(i) == '\\' && i + 1 < n) { key.append(body.charAt(i + 1)); i += 2; }
                else { key.append(body.charAt(i)); i++; }
            }
            i++; // closing quote
            while (i < n && (body.charAt(i) == ':' || Character.isWhitespace(body.charAt(i)))) i++;
            // parse value (quoted)
            StringBuilder val = new StringBuilder();
            if (i < n && body.charAt(i) == '"') {
                i++;
                while (i < n && body.charAt(i) != '"') {
                    if (body.charAt(i) == '\\' && i + 1 < n) {
                        char nc = body.charAt(i + 1);
                        if (nc == 'n') val.append('\n'); else val.append(nc);
                        i += 2;
                    } else { val.append(body.charAt(i)); i++; }
                }
                i++; // closing quote
            }
            map.put(key.toString(), val.toString());
        }
        return map;
    }
}
