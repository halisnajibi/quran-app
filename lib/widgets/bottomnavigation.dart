import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../globals.dart';

BottomNavigationBar bottomNavigation() {
  return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primary,
      currentIndex: 0,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/quran.svg"), label: 'tes'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/lamp.svg"), label: 'tes'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/duduk.svg"), label: 'tes'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/doa.svg"), label: 'tes'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/svg/bookmark.svg"), label: 'tes'),
      ]);
}
