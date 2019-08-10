package com.yigou.entity;

import java.util.Date;
import java.util.List;

public class Orders {
    private Integer id;

    private String orderCode;

    private Integer userid;

    private Integer add_id;

    private String note;

    private Date ordertime;

    private String status;

    private Float total;
    
    private List<Orderitem> orderItems;
    
    private int totalNumber;
    
    private Address address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode == null ? null : orderCode.trim();
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getAdd_id() {
        return add_id;
    }

    public void setAdd_id(Integer add_id) {
        this.add_id = add_id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

	public List<Orderitem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<Orderitem> orderItems) {
		this.orderItems = orderItems;
	}

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}
}