package com.TechnoWood.entities;

public class User {
     private int id;
     private String name;
     private String email;
     private String password;
     private String gender;
     private String about;
     private String profile;
     
     User(int id,String name,String email,String password,String gender,String about)
     {
    	 this.id=id;
    	 this.name=name;
    	 this.email=email;
    	 this.password=password;
    	 this.gender=gender;
    	 this.about=about;
    	 
     }
     
     public User()
     {
    	 
     }
     
     public User(String name,String email,String password,String gender,String about)
     {
    	 this.id=id;
    	 this.name=name;
    	 this.email=email;
    	 this.password=password;
    	 this.gender=gender;
    	 this.about=about;
    	 
     }
     
     
     // All the data members are private ,if we want to access them, so that getters and setters / or in future if we want to update 
     // data so
     
     
     // All The Setters
     public void setId(int id) 
     {
    	 this.id=id;
     }
     public void setName(String name) 
     {
    	 this.name=name;
     }
     public void setEmail(String email)
     {
    	 this.email=email;
     }
     public void setPassword(String password) 
     {
    	 this.password=password;
     }
     public void setGender(String gender) 
     {
    	 this.gender=gender;
     }
     public void setAbout(String about) 
     {
    	 this.about=about;
     }
     public void setProfile(String profile) 
     {
    	 this.profile=profile;
     }
     
     // All the Getters
     public int getId() 
     {
    	 return id;
     }
     public String getName() 
     {
    	 return name;
     }
     public String getEmail()
     {
    	 return email;
     }
     public String getPassword() 
     {
    	 return password;
     }
     
     public String getGender()
     {
    	 return gender;
     }
     public String getAbout() 
     {
    	 return about;
     }
     public String getProfile() 
     {
    	 return profile;
     }
     
}
