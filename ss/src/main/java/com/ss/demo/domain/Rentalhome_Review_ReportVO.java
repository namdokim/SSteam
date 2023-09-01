package com.ss.demo.domain;

public class Rentalhome_Review_ReportVO {
	private int report_idx;
	private int review_idx;
	private String report_date;
	private String review_report_contents;
	private String review_report_reason;
	private String review_report_process;
	private int uNo;
	
	
	public int getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public String getReview_report_contents() {
		return review_report_contents;
	}
	public void setReview_report_contents(String review_report_contents) {
		this.review_report_contents = review_report_contents;
	}
	public String getReview_report_reason() {
		return review_report_reason;
	}
	public void setReview_report_reason(String review_report_reason) {
		this.review_report_reason = review_report_reason;
	}
	public String getReview_report_process() {
		return review_report_process;
	}
	public void setReview_report_process(String review_report_process) {
		this.review_report_process = review_report_process;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
	
	@Override
	public String toString() {
		return "Rentalhome_Review_ReportVO [report_idx=" + report_idx + ", review_idx=" + review_idx + ", report_date="
				+ report_date + ", review_report_contents=" + review_report_contents + ", review_report_reason="
				+ review_report_reason + ", review_report_process=" + review_report_process + ", uNo=" + uNo + "]";
	}

	
	
}
