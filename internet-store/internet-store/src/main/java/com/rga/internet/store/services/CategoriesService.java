package com.rga.internet.store.services;

import com.rga.internet.store.domain.Category;
import com.rga.internet.store.repositories.CategoriesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoriesService {
    private CategoriesRepository categoriesRepository;

    @Autowired
    public void setCategoriesRepository(CategoriesRepository categoriesRepository) {
        this.categoriesRepository = categoriesRepository;
    }

    public List<Category> getAllCategories() {
        return categoriesRepository.findAll();
    }

    public List<Category> getCategoriesByIds(List<Long> ids) {
        return categoriesRepository.findAllById(ids);
    }
}
