package com.TechnoWood.entities;

public class Category 
{
	private int cId;
	private String categoryName;
	private String descriptions;
	
	public Category(int cId,String categoryName,String descriptions)
	{
		this.cId=cId;
	    this.categoryName=categoryName;
	    this.descriptions=descriptions;
	}
	public Category()
	{
		
	}
	public Category(String categoryName,String descriptions)
	{
		this.categoryName=categoryName;
		this.descriptions=descriptions;
	}
	
	//data Members are private so if we want to access them outside the class or package ,we need to setter/getters
	
	//setters
	
	public void setId(int cId) 
	{
		this.cId=cId;
	}
	public void setCategoryName(String CategoryName) 
	{
		this.categoryName=categoryName;
	}
	public void setDescriptions(String descriptions) 
	{
		this.descriptions=descriptions;
	}
	
	// Now all getters
	
	public int getCid() 
	{
		return cId;
	}
	public String  getCategoryName() 
	{
		return categoryName;
	}
	public String getDescriptions()
	{
		return descriptions;
	}
	
}
