import 'package:flutter/material.dart';
import '../../models/category_model.dart';
import '../../viewmodels/food_viewmodel.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;

    final foodVM = FoodViewModel();
    final foods = foodVM.getFoodsByCategory(category.id);

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: foods.isEmpty
          ? const Center(child: Text("No items found"))
          : ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return ListTile(
                  leading: Image.asset(
                    food.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(food.name),
                  subtitle: Text("₹${food.price}"),
                );
              },
            ),
    );
  }
}
