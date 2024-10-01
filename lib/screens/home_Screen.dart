import 'package:alquran/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/appbar.dart';
import '../widgets/bottomnavigation.dart';
import '../widgets/contect_tab.dart';
import '../widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("Quran App", "assets/svg/menu.svg"),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              header(),
              const SizedBox(
                height: 24,
              ),
              TabBar(
                  dividerColor: Colors.white,
                  indicatorColor: primary,
                  tabs: [
                    TabItem(
                      label: "Surah",
                    ),
                    TabItem(
                      label: "Para",
                    ),
                    TabItem(
                      label: "Page",
                    ),
                    TabItem(
                      label: "Hijb",
                    ),
                  ]),
              ContentTab()
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}

// ignore: must_be_immutable
class TabItem extends StatelessWidget {
  String label;
  TabItem({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: secondary,
      )),
    );
  }
}
