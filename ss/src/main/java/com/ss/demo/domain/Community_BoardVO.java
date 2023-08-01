package com.ss.demo.domain;

public class Community_BoardVO
{
	// board 테이블
	private int board_number;								// 글 번호
	private int user_number;								// 글 작성자 유저 번호
	private String board_title;								// 글 제목
	private int board_type;									// 글 종류
	private String board_content;							// 글 내용
	private String write_date;								// 작성일
	private int hit_count;									// 조회수
	
	private String user_name;								// 글 작성자 유저 닉네임
	private int comment_count;								// 댓글 개수
	
	public int getBoard_number()
	{
		return board_number;
	}
	public int getUser_number()
	{
		return user_number;
	}
	public String getBoard_title()
	{
		return board_title;
	}
	public int getBoard_type()
	{
		return board_type;
	}
	public String getBoard_content()
	{
		return board_content;
	}
	public String getWrite_date()
	{
		return write_date;
	}
	public int getHit_count()
	{
		return hit_count;
	}
	public String getUser_name()
	{
		return user_name;
	}
	public int getComment_count()
	{
		return comment_count;
	}
	
	public void setBoard_number(int board_number)
	{
		this.board_number = board_number;
	}
	public void setUser_number(int user_number)
	{
		this.user_number = user_number;
	}
	public void setBoard_title(String board_title)
	{
		this.board_title = board_title;
	}
	public void setBoard_type(int board_type)
	{
		this.board_type = board_type;
	}
	public void setBoard_content(String board_content)
	{
		this.board_content = board_content;
	}
	public void setWrite_date(String write_date)
	{
		this.write_date = write_date;
	}
	public void setHit_count(int hit_count)
	{
		this.hit_count = hit_count;
	}
	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}
	public void setComment_count(int comment_count)
	{
		this.comment_count = comment_count;
	}
}