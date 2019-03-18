package com.ktds.uhddaeyo.model.dto;

import java.sql.Timestamp;

public class ReviewDto {
	private int review_no;
	private int user_no;
	private int place_no;
	private int star;
	private String review;
	private Timestamp review_date;
	private int reply_no;
	private String reply;
	private Timestamp reply_date;
	private int age;
	private String gender;
	private String id;
	private String place_name;

	public ReviewDto() {

	}

	public ReviewDto(int user_no, int place_no, int star, String review) {
		this.user_no = user_no;
		this.place_no = place_no;
		this.star = star;
		this.review = review;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getPlace_no() {
		return place_no;
	}

	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public Timestamp getReview_date() {
		return review_date;
	}

	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public Timestamp getReply_date() {
		return reply_date;
	}

	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
  }
  
	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	@Override
	public String toString() {
		return "ReviewDto [review_no=" + review_no + ", user_no=" + user_no + ", place_no=" + place_no + ", star="
				+ star + ", review=" + review + ", review_date=" + review_date + ", reply_no=" + reply_no + ", reply="
				+ reply + ", reply_date=" + reply_date + ", age=" + age + ", gender=" + gender + ", id=" + id + "]";
	}
}