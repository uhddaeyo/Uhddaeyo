package com.ktds.uhddaeyo.model.dto;

public class ReplyDto {
	private int reply_no;
	private int review_no;
	private String reply;

	public ReplyDto(int reply_no, int review_no, String reply) {
		this.reply_no = reply_no;
		this.review_no = review_no;
		this.reply = reply;
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

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	@Override
	public String toString() {
		return "ReplyDto [reply=" + reply + ", reply_no=" + reply_no + ", review_no=" + review_no + "]";
	}
}

