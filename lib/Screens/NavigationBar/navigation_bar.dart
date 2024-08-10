import 'dart:ui';
import 'package:appartmentapp/Screens/Home/home_screen.dart';
import 'package:appartmentapp/Screens/Report/report_screen.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class NavigationB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationB();
}

class _NavigationB extends State<NavigationB> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedFontSize: 13,
        unselectedFontSize: 10,
        currentIndex: indexSelected,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Thông báo"),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: "Phản hồi"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "Thanh toán"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Thông tin"),
        ],
        onTap: (int index) {
          onTaphalder(index);
        },
      ),
    );
  }

  void onTaphalder(int index) {
    setState(() {
      indexSelected = index;
    });
  }

  getBody() {
    if (indexSelected == 0) {
      return HomeScreen();
    } else if (indexSelected == 1) {
      return HomeScreen();
    } else if (indexSelected == 2) {
      return const ReportScreen();
    } else if (indexSelected == 3) {
      return const Card();
    } else {
      return HomeScreen();
    }
  }
}
