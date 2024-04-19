package com.example.demo.controller;

import com.example.demo.entity.Food;
import com.example.demo.repository.FoodRepository;
import com.example.demo.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/foods")
public class FoodController {

    private final FoodService foodService;
    private final FoodRepository foodRepository;

    @Autowired
    public FoodController(FoodService foodService, FoodRepository foodRepository) {
        this.foodService = foodService;
        this.foodRepository = foodRepository;
    }

    // RESTful API endpoints
    @GetMapping("/api")
    @CrossOrigin(origins = "http://localhost:3000")
    @ResponseBody
    public List<Food> getAllFoods() {
        return foodRepository.findAll();
    }

    @GetMapping("/api/{id}")
    @ResponseBody
    public Optional<Food> getFoodById(@PathVariable Long id) {
        return foodRepository.findById(id);
    }

    @PostMapping("/api")
    @ResponseBody
    public Food addFood(@RequestBody Food food) {
        return foodRepository.save(food);
    }

    @PutMapping("/api/{id}")
    @ResponseBody
    public Food updateFood(@PathVariable Long id, @RequestBody Food foodDetails) {
        Food food = foodRepository.findById(id).orElse(null);
        if (food != null) {
            food.setTitle(foodDetails.getTitle());
            food.setPrice(foodDetails.getPrice());
            food.setImageUrl(foodDetails.getImageUrl());
            return foodRepository.save(food);
        }
        return null;
    }

    @DeleteMapping("/api/{id}")
    @ResponseBody
    public void deleteFood(@PathVariable Long id) {
        foodRepository.deleteById(id);
    }

    // HTML view rendering methods
    @GetMapping("/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model) {
        // Retrieve the food item by ID from the database
        Food food = foodRepository.findById(id).orElse(null);
        
        if (food != null) {
            model.addAttribute("food", food);
            return "editFood"; // Return the edit form template
        } else {
            return "redirect:/foods"; // Redirect to the food list page if food not found
        }
    }

    @PostMapping("/{id}/edit")
    public String updateFood(@PathVariable Long id, @RequestParam String title, @RequestParam int price, @RequestParam String imageUrl) {
        // Retrieve the food item by ID from the database
        Optional<Food> foodOptional = foodRepository.findById(id);
        if (foodOptional.isPresent()) {
            Food food = foodOptional.get();
            food.setTitle(title);
            food.setPrice(price);
            food.setImageUrl(imageUrl);
            foodRepository.save(food); // Update the food information in the database
        }
        return "redirect:/foods"; // Redirect to the food list page after update
    }

    @GetMapping
    public String getFoods(Model model) {
        model.addAttribute("foods", foodRepository.findAll());
        return "foods";
    }

    @DeleteMapping("/{id}")
    public String deleteFoodView(@PathVariable Long id) {
        foodRepository.deleteById(id);
        return "redirect:/foods";
    }

    @PostMapping
    public String addFoodView(@RequestParam String title, @RequestParam int price, @RequestParam String imageUrl) {
        Food food = new Food();
        food.setTitle(title);
        food.setPrice(price);
        food.setImageUrl(imageUrl);
        foodRepository.save(food);
        return "redirect:/foods";
    }
}
