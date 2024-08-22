import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_del/pages/Profile.dart';
import 'package:food_del/pages/home.dart';
import 'package:food_del/pages/order.dart';
import 'package:food_del/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabindex = 0;
  late List<Widget> pages;
  late List<Widget> currentPage;
  late Home homepage;
  late ProfilePage profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    homepage = const Home();
    order = const Order();
    profile = const ProfilePage();
    wallet = const Wallet();
    pages = [homepage, order, wallet, profile];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.blue.shade100,
          color: Colors.black,
          
          animationDuration: const Duration(milliseconds: 500),
          onTap: (int index){
            setState(() {
              currentTabindex=index;
            });
          },
          items:  [
            Icon(
              Icons.home,
              color: Colors.blue.shade100,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.blue.shade100,
            ),
            Icon(
              Icons.attach_money,
              color: Colors.blue.shade100,
            ),
            Icon(
              Icons.person_2_outlined,
              color: Colors.blue.shade100,
            )
          ]),
          body: pages[currentTabindex],
    );
  }
}
