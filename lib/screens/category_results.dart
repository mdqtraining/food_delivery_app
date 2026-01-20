import 'package:flutter/material.dart';
import '../data/dummy_foods.dart';
import '../widgets/food_item.dart';

class CategoryResultScreen extends StatelessWidget {
  final String categoryId;

  const CategoryResultScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final foods = dummyFoods
        .where((food) => food.categoryId == categoryId)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Items")),
      body: foods.isEmpty
          ? const Center(child: Text("No items found"))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: foods.length,
              itemBuilder: (context, index) {
                return FoodItem(food: foods[index]);
              },
            ),
    );
  }
}
