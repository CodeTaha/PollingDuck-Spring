/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package User_Manager;

import com.google.gson.Gson;

/**
 *
 * @author Taha
 */
public class User_Detail {
    private int uid;
   private String handle;
    private int category_list_json[];
    Gson gson=new Gson();
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public int[] getCategory_list_json() {
        return category_list_json;
    }

    public void setCategory_list_json(String category_list_json) {
        
        this.category_list_json = gson.fromJson(category_list_json, int[].class);
    }
 
    
    
    
}
