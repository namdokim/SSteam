package com.ss.demo.domain;

public class Community_BoardVO
{
	// board 테이블
	public int board_number;								// 글 번호
	public int user_number;									// 글 작성자 유저 번호
	public String board_title;								// 글 제목
	public int board_type;									// 글 종류
	public String board_content;							// 글 내용
	public String write_date;								// 작성일
	public int hit_count;									// 조회수
	
	public String user_name;								// 글 작성자 유저 닉네임
	public int comment_count;								// 댓글 개수
}