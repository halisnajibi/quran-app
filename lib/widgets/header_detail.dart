import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HeaderDetail extends StatelessWidget {
  String namaLatin;
  String arti;
  String turun;
  int jumlahAyat;
  HeaderDetail({
    super.key,
    required this.namaLatin,
    required this.arti,
    required this.turun,
    required this.jumlahAyat,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 257,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffDF98FA),
                  Color(0xff9055FF),
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("${namaLatin}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))),
                const SizedBox(
                  height: 5,
                ),
                Text("${arti}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white))),
                Divider(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${turun}",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                    Text(" ${jumlahAyat}",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SvgPicture.asset("assets/svg/bismillah.svg"),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Opacity(
                opacity: 0.2,
                child: SvgPicture.asset(
                  "assets/svg/book.svg",
                  width: 327,
                )))
      ],
    );
  }
}
