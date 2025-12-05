import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _bottomNavBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SEARCH BAR
              _searchBar(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
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

  // Widget _bottomNavBar(BuildContext context) {
  //   return BottomNavigationBar(
  //     currentIndex: 1,
  //     selectedItemColor: Colors.orange,
  //     unselectedItemColor: Colors.grey,
  //     onTap: (index) {
  //       if (index == 0) Navigator.pushReplacementNamed(context, "/home");
  //       if (index == 1) Navigator.pushReplacementNamed(context, "/search");
  //       if (index == 2) Navigator.pushReplacementNamed(context, "/cart");
  //       if (index == 3) Navigator.pushReplacementNamed(context, "/profile");
  //     },
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  //       BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
  //       BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
  //       BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  //     ],
  //   );
  // }
}
