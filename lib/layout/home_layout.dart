import 'package:flutter/material.dart';
import 'package:store_app/views/cart_screen.dart';
import 'package:store_app/views/favorites_screen.dart';
import 'package:store_app/views/home_screen.dart';
import 'package:store_app/views/profile_screen.dart';
import 'package:store_app/views/search_screen.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'Home Layout';

  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    FavoritesScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.category),
        ),
        title: Text(
          'New Trend',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          //   add changeIndex Function
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),


      body: tabs[selectedIndex],
    );
  }
}
