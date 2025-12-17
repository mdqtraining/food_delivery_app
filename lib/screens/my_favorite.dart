import 'package:flutter/material.dart';

class MyFavoritesScreen extends StatelessWidget {
  const MyFavoritesScreen({super.key});

  Widget favoriteCard({
    required String imageUrl,
    required String title,
    required String price,
    VoidCallback? onRemove,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          // IMAGE
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // REMOVE ICON
          InkWell(
            onTap: onRemove,
            child: const Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Favorites"),
        backgroundColor: const Color(0xFFFFA000),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            favoriteCard(
              imageUrl:
                  "https://img.freepik.com/free-photo/delicious-burger_1232-83.jpg",
              title: "Cheese Burger",
              price: "\$8.99",
              onRemove: () {
                print("Remove burger");
              },
            ),

            favoriteCard(
              imageUrl:
                  "https://img.freepik.com/free-photo/top-view-tasty-pizza_23-2148578925.jpg",
              title: "Pizza",
              price: "\$14.50",
              onRemove: () {
                print("Remove pizza");
              },
            ),
          ],
        ),
      ),
    );
  }
}
