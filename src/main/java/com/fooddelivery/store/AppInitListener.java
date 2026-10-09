package com.fooddelivery.store;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.*;

@WebListener
public class AppInitListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String realPath = sce.getServletContext().getRealPath("/WEB-INF/data");
        if (realPath == null) {
            realPath = System.getProperty("java.io.tmpdir") + "/hotplate-data";
        }
        JsonStore.init(realPath);
        seedIfEmpty();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) { }

    private void seedIfEmpty() {
        if (JsonStore.readAll("menu_items").isEmpty()) {
            String[][] seedMenu = {
                {"1","Crispy Veg Spring Rolls","149","Starters","true","Golden rolls stuffed with vegetables and noodles","images/menu/veg-biryani.jpg"},
                {"2","Paneer Tikka","229","Starters","true","Marinated cottage cheese grilled in tandoor with spices","images/menu/butter-chicken.jpg"},
                {"3","Chicken Lollipop","279","Starters","false","Spicy chicken lollipops with schezwan dipping sauce","images/menu/popcorn-chicken.jpg"},
                {"4","Fish Fingers","249","Starters","false","Crispy battered fish fingers served with tartar sauce","images/menu/chicken-zinger.jpg"},
                {"5","Butter Chicken","349","Main Course","false","Tender chicken in rich creamy tomato-butter gravy","images/menu/butter-chicken.jpg"},
                {"6","Dal Makhani","249","Main Course","true","Slow-cooked black lentils with butter and cream","images/menu/veg-biryani.jpg"},
                {"7","Paneer Butter Masala","299","Main Course","true","Soft paneer cubes in smooth buttery tomato gravy","images/menu/naan.jpg"},
                {"8","Chicken Biryani","349","Main Course","false","Fragrant basmati rice cooked with spiced chicken","images/menu/chicken-biryani.jpg"},
                {"9","Veg Biryani","249","Main Course","true","Aromatic basmati with fresh vegetables and saffron","images/menu/veg-biryani.jpg"},
                {"10","Butter Naan","49","Breads and Rice","true","Soft leavened bread topped with butter","images/menu/naan.jpg"},
                {"11","Garlic Naan","59","Breads and Rice","true","Naan topped with garlic and coriander","images/menu/naan.jpg"},
                {"12","Mango Lassi","99","Beverages","true","Chilled yoghurt drink blended with Alphonso mango","images/menu/mango-lassi.jpg"}
            };
            List<Map<String,String>> list = new ArrayList<>();
            for (String[] m : seedMenu) {
                Map<String,String> rec = new LinkedHashMap<>();
                rec.put("id", m[0]);
                rec.put("name", m[1]);
                rec.put("price", m[2]);
                rec.put("category", m[3]);
                rec.put("veg", m[4]);
                rec.put("description", m[5]);
                rec.put("image", m[6]);
                rec.put("restaurantId", "1");
                list.add(rec);
            }
            JsonStore.writeAll("menu_items", list);
        }

        if (JsonStore.readAll("restaurants").isEmpty()) {
            String[][] seedRest = {
                {"1","KFC","images/restaurants/kfc.jpg","Chicken, Burgers, Fast Food","30-40 min","4.3","250","chicken,burger,fast food","40% OFF up to Rs.120","active"},
                {"2","Domino's Pizza","images/restaurants/dominos.jpg","Pizza, Pasta, Italian","25-35 min","4.5","400","pizza,pasta,italian","Buy 1 Get 1 Free","active"},
                {"3","Biryani House","images/restaurants/biryani-house.jpg","Biryani, Mughlai, North Indian","40-50 min","4.6","350","biryani,mughlai,north indian","30% OFF on first order","active"},
                {"4","McDonald's","images/restaurants/mcdonalds.jpg","Burgers, Fast Food, Shakes","20-30 min","4.2","200","burger,fast food,shakes","Free item on Rs.199+","active"},
                {"5","Sushi Sakura","images/restaurants/sushi-sakura.jpg","Japanese, Sushi, Rolls","45-55 min","4.7","800","sushi,japanese,rolls","20% OFF weekends","active"},
                {"6","Cafe Coffee Day","images/restaurants/cafe-coffee.jpg","Coffee, Beverages, Sandwiches","15-25 min","4.1","300","coffee,beverages,sandwich","Buy 2 Get 1 Free","active"},
                {"7","Dosa Plaza","images/restaurants/dosa-plaza.jpg","South Indian, Dosa, Idli","25-35 min","4.4","180","dosa,south indian,idli","Flat Rs.50 off on Rs.249+","active"},
                {"8","Wow China","images/restaurants/wow-china.jpg","Chinese, Noodles, Dim Sum","35-45 min","4.0","280","chinese,noodles,dim sum","Extra 15% OFF","inactive"},
                {"9","The Salad Bowl","images/restaurants/salad-bowl.jpg","Healthy, Salads, Wraps","20-30 min","4.3","320","healthy,salad,wraps","10% cashback","active"},
                {"10","Dessert Factory","images/restaurants/dessert-factory.jpg","Desserts, Ice Cream, Cakes","30-40 min","4.5","250","desserts,ice cream,cakes","Free dessert on Rs.399+","active"}
            };
            List<Map<String,String>> list = new ArrayList<>();
            for (String[] r : seedRest) {
                Map<String,String> rec = new LinkedHashMap<>();
                rec.put("id", r[0]);
                rec.put("name", r[1]);
                rec.put("image", r[2]);
                rec.put("cuisine", r[3]);
                rec.put("time", r[4]);
                rec.put("rating", r[5]);
                rec.put("costForTwo", r[6]);
                rec.put("tags", r[7]);
                rec.put("promo", r[8]);
                rec.put("status", r[9]);
                list.add(rec);
            }
            JsonStore.writeAll("restaurants", list);
        }

        if (JsonStore.readAll("users").isEmpty()) {
            String[][] seedUsers = {
                {"1","Arjun Mehta","arjun.mehta@example.com","9876543210","221B Indiranagar, Bangalore - 560038"},
                {"2","Priya Sharma","priya.sharma@example.com","9988776655","45 Koramangala 5th Block, Bangalore - 560095"}
            };
            List<Map<String,String>> list = new ArrayList<>();
            for (String[] u : seedUsers) {
                Map<String,String> rec = new LinkedHashMap<>();
                rec.put("id", u[0]);
                rec.put("name", u[1]);
                rec.put("email", u[2]);
                rec.put("phone", u[3]);
                rec.put("address", u[4]);
                rec.put("password", "demo1234");
                rec.put("joined", "2026-05-12");
                list.add(rec);
            }
            JsonStore.writeAll("users", list);
        }
    }
}
