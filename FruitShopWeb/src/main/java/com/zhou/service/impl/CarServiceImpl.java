package com.zhou.service.impl;

import com.zhou.base.BaseDao;
import com.zhou.base.BaseServiceImpl;
import com.zhou.map.CarMapper;
import com.zhou.pojo.Car;
import com.zhou.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;

public class CarServiceImpl extends BaseServiceImpl<Car> implements CarService {

    @Autowired
    private CarMapper carMapper;

    @Override
    public BaseDao<Car> getBaseDao() {
        return carMapper;
    }

    public CarMapper getCarMapper() {
        return carMapper;
    }

    public void setCarMapper(CarMapper carMapper) {
        this.carMapper = carMapper;
    }
}
