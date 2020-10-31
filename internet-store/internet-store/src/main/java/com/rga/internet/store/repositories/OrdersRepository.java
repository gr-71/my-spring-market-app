package com.rga.internet.store.repositories;

import com.rga.internet.store.domain.Order;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrdersRepository extends CrudRepository<Order, Long> {
}
