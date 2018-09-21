package com.forhadmethun.simplesearchapplication.test;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookingRepository extends JpaRepository<HotelBookingEntity,Long> {
    List<HotelBookingEntity> findByPricePerNightLessThan(double price);

}
