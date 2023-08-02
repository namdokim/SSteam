package com.ss.demo.domain;

public class SearchVO {
	
	private String searchType;
	private String searchValue;
	private String type;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "SearchVO [searchType=" + searchType + ", searchValue=" + searchValue + ", type=" + type + "]";
	}
	
}
