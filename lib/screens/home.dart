import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List screens = [ProfileScreen(),SearchScreen(),]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: _bottomNavBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP BAR → Profile + Location
              _topBar(context),

              const SizedBox(height: 20),

              // SEARCH BAR
              _searchBar(),

              const SizedBox(height: 20),

              // PROMO BANNER
              _promoBanner(),

              const SizedBox(height: 20),

              // CATEGORIES
              const Text(
                "Categories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _categoryList(),

              const SizedBox(height: 25),

              // POPULAR RESTAURANTS
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

  // ------------------ COMPONENTS BELOW ------------------

  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Location
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Delivery to", style: TextStyle(color: Colors.black54)),
            SizedBox(height: 5),
            Text(
              "Current Location ▼",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),

        // PROFILE ICON WITH NAVIGATION
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

  Widget _promoBanner() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
            "https://img.freepik.com/free-vector/food-delivery-banner-template_23-2148564700.jpg",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _categoryList() {
    final List<String> categories = [
      "Burger",
      "Pizza",
      "Drinks",
      "Snacks",
      "Dessert",
    ];

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _popularRestaurants() {
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
            ],
          ),
          child: Row(
            children: [
              // Restaurant Image
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://img.freepik.com/free-photo/delicious-burger_1232-83.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Restaurant Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
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
                      "⭐ 4.5   •   20-25 min",
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

  Widget _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/home");
            break;
          case 1:
            Navigator.pushNamed(context, "/search");
            break;
          case 2:
            Navigator.pushNamed(context, "/cart");
            break;
          case 3:
            Navigator.pushNamed(context, "/profile");
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
