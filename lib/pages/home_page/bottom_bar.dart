import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:sesampah/pages/home_page/home.dart';
import 'package:sesampah/pages/Pesanan/pesanan.dart';
import 'package:sesampah/pages/home_page/profile/profile.dart';

class BattomBar extends StatefulWidget {
  const BattomBar({Key? key}) : super(key: key);

  @override
  State<BattomBar> createState() => _BattomBarState();
}

class _BattomBarState extends State<BattomBar> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Beranda", const Color(0xFF5C94AF),
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.assignment, "Pesanan", const Color(0xFF5C94AF),
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.person, "Akun", const Color(0xFF5C94AF),
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
  ]);

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return const PageHome(title: "");
      case 1:
        return const Pesanan(address: '');
      case 2:
        return const ProfilePerson();
    }

      return GestureDetector(
        child: const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        onTap: () {
          if (_navigationController.value == tabItems.length - 1) {
            _navigationController.value = 0;
          } else {
            _navigationController.value!;
          }
        },
      );
    }

    Widget bottomNav() {
      return CircularBottomNavigation(
        tabItems,
        controller: _navigationController,
        barHeight: bottomNavBarHeight,
        barBackgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 300),
        selectedCallback: (selectedPos) {
          setState(() {
            this.selectedPos = selectedPos!;
            print(_navigationController.value);
          });
        },
      );
    }

    @override
    void dispose() {
      super.dispose();
      _navigationController.dispose();
    }
  }
