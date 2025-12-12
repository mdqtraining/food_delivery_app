import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  Widget orderCard({
    required String imageUrl,
    required String title,
    required String price,
    required String status,
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

          // TEXT INFO
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
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Orders",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xFFFFA000),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderCard(
              imageUrl:
                  "https://img.freepik.com/free-photo/delicious-burger_1232-83.jpg",
              title: "Cheese Burger",
              price: "\$8.99",
              status: "Delivered",
            ),

            orderCard(
              imageUrl:
                  "https://img.freepik.com/free-photo/close-up-french-fries-basket_23-2149133942.jpg",
              title: "French Fries",
              price: "\$4.99",
              status: "Cancelled",
            ),

            orderCard(
              imageUrl:
                  "https://img.freepik.com/free-photo/top-view-tasty-pizza_23-2148578925.jpg",
              title: "Pepperoni Pizza",
              price: "\$14.50",
              status: "Ongoing",
            ),
          ],
        ),
      ),
    );
  }
}
