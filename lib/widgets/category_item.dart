import 'package:flutter/material.dart';
import 'package:hunger_hub/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryItem({super.key, required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFB74D),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.image,
              height: 32,
              width: 32,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 6),
            Text(
              category.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
