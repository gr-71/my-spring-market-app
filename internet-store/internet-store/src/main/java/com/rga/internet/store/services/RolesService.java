package com.rga.internet.store.services;

import com.rga.internet.store.domain.Role;
import com.rga.internet.store.repositories.RolesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RolesService {
    private RolesRepository rolesRepository;

    @Autowired
    public void setRolesRepository(RolesRepository rolesRepository) {
        this.rolesRepository = rolesRepository;
    }

    public Role findByName(String name) {
        return rolesRepository.findOneByName(name);
    }
}
