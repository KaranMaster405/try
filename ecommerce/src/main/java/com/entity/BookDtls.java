package com.entity;

public class BookDtls {
private int book_Id;
private String name;
private String author;
private String price;
private String bookType; 
private String status;
private String photo;
private String email;
private int stock;
private String TOB;

public BookDtls() {
	super();
	// TODO Auto-generated constructor stub
}
public BookDtls(String name, String author, String price, String bookType, String status, String photo, String email,int stock,String TOB) {
	super();
	
	this.name = name;
	this.author = author;
	this.price = price;
	this.bookType = bookType;
	this.status = status;
	this.photo = photo;
	this.email = email;
	this.stock=stock;
	this.TOB=TOB;
	
}
public int getBook_Id() {
	return book_Id;
}
public void setBook_Id(int book_Id) {
	this.book_Id = book_Id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = price;
}
public String getBookType() {
	return bookType;
}
public void setBookType(String bookType) {
	this.bookType = bookType;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}

public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}


public String getTOB() {
	return TOB;
}
public void setTOB(String tOB) {
	TOB = tOB;
}
@Override
public String toString() {
	return "BookDtls [book_Id=" + book_Id + ", name=" + name + ", author=" + author + ", price=" + price + ", bookType="
			+ bookType + ", status=" + status + ", photo=" + photo + ", email=" + email + ", stock=" + stock + ", TOB="
			+ TOB + "]";
}










}
