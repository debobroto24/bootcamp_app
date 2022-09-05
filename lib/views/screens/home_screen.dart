import 'package:bootcamp_app/views/screens/blog_list_screen.dart';
import 'package:bootcamp_app/views/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController = PageController();
  List<Widget> _screens = [
    BlogsListScreen(),
    FavoritesScreen(),
  ];
  int _selectIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onItemTapped(int selectIndex) {
    _pageController.jumpToPage(selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        // ignore: sort_child_properties_last
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectIndex == 0 ? Colors.blueAccent : Colors.grey),
            backgroundColor: Colors.grey,
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp,
                color: _selectIndex == 1 ? Colors.blueAccent : Colors.grey),
            backgroundColor: Colors.grey,
            label: "Wishlist",
          ),
        ],
      ),
    );
  }
}
