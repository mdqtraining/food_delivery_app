import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget menuItem(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 26),
          const SizedBox(width: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // SCROLLABLE CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // PROFILE CARD
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.orange,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Vicky",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "vicky@gmail.com",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.edit, color: Colors.grey, size: 22),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // MENU ITEMS
                    menuItem(Icons.history, "My Orders"),
                    menuItem(Icons.payment, "Payment Method"),
                    menuItem(Icons.location_on, "My Address"),
                    menuItem(Icons.card_giftcard, "My Promocodes"),
                    menuItem(Icons.favorite, "My Favorite"),
                    menuItem(Icons.logout, "Sign out"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index == 0) Navigator.pushReplacementNamed(context, "/home");
        if (index == 1) Navigator.pushReplacementNamed(context, "/search");
        if (index == 2) Navigator.pushReplacementNamed(context, "/cart");
        if (index == 3) Navigator.pushReplacementNamed(context, "/profile");
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
