import 'package:flutter/material.dart';
import '../data/dummy_categories.dart';
import '../widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color primaryOrange = Color(0xFFFFA000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ---------- COLLAPSING LOCATION + PROFILE ----------
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            pinned: false,
            expandedHeight: 0,
            automaticallyImplyLeading: false,

            flexibleSpace: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).primaryColor,
                            size: 28,
                          ),
                          const SizedBox(width: 6),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  Text(
                                    "Current Location",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Tambaram, Chennai",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    CircleAvatar(
                      radius: 22,
                      backgroundColor: primaryOrange,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ---------- PINNED SEARCH BAR ----------
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchBarSliverDelegate(height: 80, child: _searchBar()),
          ),

          // ---------- CONTENT ----------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
        ],
      ),
    );
  }

  // ---------- SEARCH BAR ----------
  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search food, restaurants...",
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ---------- PROMO ----------
  Widget _promoBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/images/promo.png",
        height: 160,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  // ---------- CATEGORIES ----------
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

  // ---------- RESTAURANTS ----------
  Widget _popularRestaurants() {
    return Column(
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
                child: Image.asset(
                  "assets/images/Pumpkin.webp",
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
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
                    Text("4.5 • 20-25 min"),
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

// ---------- SLIVER DELEGATE ----------
class SearchBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  SearchBarSliverDelegate({required this.child, required this.height});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
