import 'package:alquran/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appbar(String title, String iconMenu) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          SvgPicture.asset("${iconMenu}"),
          const SizedBox(
            width: 24,
          ),
          Text(title,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primary))),
          const Spacer(),
          SvgPicture.asset("assets/svg/search.svg"),
        ],
      ),
    ),
  );
}
