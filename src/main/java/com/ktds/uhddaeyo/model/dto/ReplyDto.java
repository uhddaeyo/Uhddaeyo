package com.ktds.uhddaeyo.model.dto;

public class ReplyDto {
	private String reply;
	private int reply_no;

	public ReplyDto(String reply, int reply_no) {
		this.reply = reply;
		this.reply_no = reply_no;
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

	@Override
	public String toString() {
		return "ReplyDto [reply_no=" + reply_no + ", reply=" + reply + "]";
	}
}
