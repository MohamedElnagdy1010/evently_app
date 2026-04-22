// ignore_for_file: file_names

import 'package:evently_app/common/gen/assets.gen.dart';
import 'package:evently_app/screens/home/tabs/favtab/fav_tab.dart';
import 'package:evently_app/screens/home/tabs/hometab/home_tab.dart';
import 'package:evently_app/screens/home/tabs/profiletab/profil_tab.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  static const String routeName = "/Homescreen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List tabs = [HomeTab(), FavTab(), ProfilTab()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () {},
          shape: CircleBorder(),
          elevation: 50,
          child: Icon(Icons.add, color: Colors.white, size: 24),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Assets.icons.homeUnselected.svg(),
              activeIcon: Assets.icons.home.svg(),

              label: "home",
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.heartUnselected.svg(),
              activeIcon: Assets.icons.heart.svg(),
              label: "favorite",
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.user.svg(),
              activeIcon: Assets.icons.userSelected.svg(),
              label: "profile",
            ),
          ],
        ),

        body: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 24),
          child: tabs[index],
        ),
      ),
    );
  }
}
