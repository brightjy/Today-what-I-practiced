package com.hrd.test.dto;

public class JoinDto {
	private int custno;
	private String custname;
	private String grade;
	private int price_sum;
	public JoinDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public JoinDto(int custno, String custname, String grade, int price_sum) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.grade = grade;
		this.price_sum = price_sum;
	}
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPrice_sum() {
		return price_sum;
	}
	public void setPrice_sum(int price_sum) {
		this.price_sum = price_sum;
	}
	@Override
	public String toString() {
		return "JoinDto [custno=" + custno + ", custname=" + custname + ", grade=" + grade + ", price_sum=" + price_sum
				+ "]";
	}
	
	
}
