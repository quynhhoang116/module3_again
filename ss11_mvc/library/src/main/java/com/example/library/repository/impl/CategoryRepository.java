package com.example.library.repository.impl;

import com.example.library.model.Category;
import com.example.library.repository.ICategoryRepository;

import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    private static List<Category> categoryList= new ArrayList<>();
    static {
        categoryList.add(new Category(1,"Tự nhiên"));
        categoryList.add(new Category(2,"Xã hội"));
        categoryList.add(new Category(3,"Truyện"));
        categoryList.add(new Category(4,"Tiểu thuyết"));
        categoryList.add(new Category(5,"khác"));

    }

    @Override
    public List<Category> findAllCategory(){
        return categoryList;
    }

    @Override
    public List<Category> bookCategoryList() {
            List<Category> bookcategoryList =new ArrayList<>();
            for (int i = 0; i < categoryList.size(); i++) {
                bookcategoryList.add(categoryList.get(i));
            }
            return bookcategoryList;
        }
    }

