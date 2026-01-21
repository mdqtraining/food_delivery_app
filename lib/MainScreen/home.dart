import 'package:flutter/material.dart';
import '../data/dummy_categories.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryOrange = Color(0xFFFFA000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(context),
              const SizedBox(height: 20),

              _searchBar(),
              const SizedBox(height: 20),

              _promoBanner(),
              const SizedBox(height: 25),

              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              _categoryList(context),

              const SizedBox(height: 25),

              const Text(
                "Popular Restaurants",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              _popularRestaurants(),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- TOP BAR ----------------

  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // LOCATION BLOCK
        GestureDetector(
          onTap: () {
            // later: open location selector
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Icon(Icons.location_on, color: Colors.orange, size: 30),
              ),
              const SizedBox(width: 6),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Current Location",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    "Tambaram, Chennai",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ),

        // PROFILE ICON
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/profile"),
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Color(0xFFFFA000),
            child: Icon(Icons.person, color: Colors.white, size: 26),
          ),
        ),
      ],
    );
  }

  // ---------------- SEARCH ----------------

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search food, restaurants...",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ---------------- PROMO ----------------

  Widget _promoBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Image.asset("assets/images/promo.png", fit: BoxFit.cover),
      ),
    );
  }

  // ---------------- CATEGORIES ----------------

  Widget _categoryList(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyCategories.length,
        itemBuilder: (context, index) {
          final category = dummyCategories[index];

          return CategoryItem(
            category: category,
            onTap: () {
              Navigator.pushNamed(context, '/category', arguments: category);
            },
          );
        },
      ),
    );
  }

  // ---------------- POPULAR RESTAURANTS ----------------

  Widget _popularRestaurants() {
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Pumpkin.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pumpkin Tales Restaurant",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text("Alwarpet", style: TextStyle(color: Colors.black54)),
                    SizedBox(height: 6),
                    Text(
                      "4.5 • 20-25 min",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
