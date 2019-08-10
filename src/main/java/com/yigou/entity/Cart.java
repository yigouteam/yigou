package com.yigou.entity;

public class Cart {
    private Integer id;

    private Integer userid;

    private Integer goodsid;

    private Integer number;

    private Float price;
    
    private Goods product;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

	public Goods getProduct() {
		return product;
	}

	public void setProduct(Goods product) {
		this.product = product;
	}
}