package com.hrd.dto;

public class SumPriceDto {
	private int custno;
	private String custname;
	private String grade;
	private int sum_price;
	public SumPriceDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SumPriceDto(int custno, String custname, String grade, int sum_price) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.grade = grade;
		this.sum_price = sum_price;
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
	public int getSum_price() {
		return sum_price;
	}
	public void setSum_price(int sum_price) {
		this.sum_price = sum_price;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "SumPriceDto [custno=" + custno + ", custname=" + custname + ", grade=" + grade + ", sum_price="
				+ sum_price + "]";
	}
	
	
	
}
