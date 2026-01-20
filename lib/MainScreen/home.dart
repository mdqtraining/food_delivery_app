import 'package:flutter/material.dart';
import '../data/dummy_categories.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryOrange = Color(0xFFFFA000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Delivery to", style: TextStyle(color: Colors.black54)),
            const SizedBox(height: 5),

            GestureDetector(
              onTap: () {
                // later: open address selection
              },
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.orange, size: 20),
                  SizedBox(width: 4),
                  Text(
                    "Current Location",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ],
        ),

        GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/profile"),
          child: const CircleAvatar(
            radius: 22,
            backgroundColor: Colors.orange,
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
          category: category, // pass the model
          onTap: () {
            Navigator.pushNamed(
              context,
              '/category',
              arguments: category,
            );
          },
        );
      },
    ),
  );
}


  // ---------------- RESTAURANTS ----------------

  Widget _popularRestaurants() {
    return Column(
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () {
            // Later: open restaurant details
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
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
                      image: NetworkImage(
                        "https://img.freepik.com/free-photo/delicious-burger_1232-83.jpg",
                      ),
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
                        "Foodie Restaurant",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Burgers • Fast Food",
                        style: TextStyle(color: Colors.black54),
                      ),
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
          ),
        );
      }),
    );
  }
}
