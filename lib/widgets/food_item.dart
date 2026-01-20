import 'package:flutter/material.dart';
import '../models/food_model.dart';

class FoodItem extends StatelessWidget {
  final FoodModel food;

  const FoodItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        children: [
          // IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              food.image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          // DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "₹${food.price}",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
