package com.yigou.service;

import java.util.List;

import com.yigou.entity.Address;

public interface AddressService {
      Address get(Integer id);
      
      void add(Address address);
      
      List<Address> listByUser(Integer user_id);
      
      void update(Address address);
      
      void delete(Integer id);
}
