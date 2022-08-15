import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/themes/app_global_colors.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BottomBarComponent extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBarComponent({Key? key}) : super(key: key);

  @override
  State<BottomBarComponent> createState() => _BottomBarComponentState();
}

class _BottomBarComponentState extends State<BottomBarComponent> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text("Account Page")),
    const Center(child: Text("Cart Page")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: AppGlobalColors.selectedNavBarColor,
        unselectedItemColor: AppGlobalColors.unselectedNavBarColor,
        backgroundColor: AppGlobalColors.backgroundColor,
        iconSize: 28,
        onTap: (int page) {
          _page = page;

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? AppGlobalColors.selectedNavBarColor
                        : AppGlobalColors.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? AppGlobalColors.selectedNavBarColor
                        : AppGlobalColors.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outline_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? AppGlobalColors.selectedNavBarColor
                        : Colors.transparent,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Badge(
                  elevation: 0,
                  badgeContent: const Text('3'),
                  badgeColor: Colors.transparent,
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
