package com.example.demo.service;

import com.example.demo.entity.Food;
import com.example.demo.repository.FoodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodService {

    @Autowired
    private FoodRepository foodRepository;

    public List<Food> getAllFood() {
        return foodRepository.findAll();
    }

    public Food getFoodById(Long id) {
        return foodRepository.findById(id).orElse(null);
    }

    public Food createFood(Food food) {
        return foodRepository.save(food);
    }

    public void deleteFood(Long id) {
        foodRepository.deleteById(id);
    }

    public Food updateFood(Long id, Food newFoodData) {
        Food existingFood = foodRepository.findById(id).orElse(null);
        if (existingFood != null) {
            existingFood.setTitle(newFoodData.getTitle());
            existingFood.setPrice(newFoodData.getPrice());
            existingFood.setImageUrl(newFoodData.getImageUrl());
            return foodRepository.save(existingFood);
        }
        return null;
    }
}

