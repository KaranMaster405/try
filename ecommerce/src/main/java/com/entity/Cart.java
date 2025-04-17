package com.entity;

public class Cart {
private int cid;
private int bid;
private int uid;
private String book_Name;
private String author;
private Double price;
private Double total_Price;
private int NOB;
private int stock;

public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public int getBid() {
	return bid;
}
public void setBid(int bid) {
	this.bid = bid;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getBookName() {
	return book_Name;
}
public void setBookName(String bookName) {
	this.book_Name = bookName;
}
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public Double getPrice() {
	return price;
}
public void setPrice(Double price) {
	this.price = price;
}
public Double getTotalPrice() {
	return total_Price;
}
public void setTotalPrice(Double totalPrice) {
	this.total_Price = totalPrice;
}
public int getNOB() {
	return NOB;
}
public void setNOB(int nOB) {
	this.NOB = nOB;
}
public int getStock() {
	return stock;
}
public void setStock(int stock) {
	this.stock = stock;
}




}
