import 'package:flutter/material.dart';
import 'package:project_x/Components/AppColors.dart';

class BottomNavigation extends StatefulWidget{
  @override
  _BottomNavigation createState()=>_BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  
  int _selectedIndex = 0;

   @override
  void initState() {
    super.initState();
    // Listen to route changes and update selected index accordingly
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedIndexFromRoute();
    });
  }

    // Update selected index based on the current route
  void _updateSelectedIndexFromRoute() {
    String currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    
    if (currentRoute == '/') {
      _selectedIndex = 0;
    } else if (currentRoute.contains('/shop_now')) {
      _selectedIndex = 1;
    } else if (currentRoute == '/bag') {
      _selectedIndex = 2;
    } else if (currentRoute == '/my_favorites') {
      _selectedIndex = 3;
    } else if (currentRoute == '/my_profile') {
      _selectedIndex = 4;
    } else {
      _selectedIndex = 0; // Default to Home
    }

    setState(() {});
  }

 void _onItemTapped(BuildContext context, int index) {
    // Update selected index and navigate to the corresponding route
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/shop_now');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/bag');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/my_favorites');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/my_profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Adjust corner radius
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.gray,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => _onItemTapped(context, index),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Shop'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag), label: 'Bag'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ]),
      );
  }
 }   
