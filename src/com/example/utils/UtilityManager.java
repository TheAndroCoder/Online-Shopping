package com.example.utils;

public class UtilityManager {
	public UtilityManager() {}
	public String getBeautifiedAmount(int price) {
		String beautifiedAmount=Integer.toString(price);
		StringBuilder sb = new StringBuilder(beautifiedAmount);
		if(beautifiedAmount.length()<=3)
		return beautifiedAmount;
		else if(beautifiedAmount.length()>3 && beautifiedAmount.length()<=5){
			sb.insert(sb.length()-3, ',');
			return sb.toString();
		}else {
			sb.insert(sb.length()-3, ',');
			sb.insert(sb.length()-6, ',');
			return sb.toString();
		}
	}
	public String getCostPrice(int marked_price,int discount) {
		double dis = 0.01*discount*marked_price;
		int cost_price = marked_price-(int)dis;
		String beautifiedAmount=getBeautifiedAmount(cost_price);
		return beautifiedAmount;
	}
	public String[] getFeaturesArray(String csv) {
		return csv.split(",");
	}
	public int getCostPriceAsInteger(String price) {
		return Integer.parseInt(price.replaceAll(",", ""));
	}
}
