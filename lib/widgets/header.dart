import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals.dart';

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Assalamualaikum",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: secondary,
              ))),
          const SizedBox(
            height: 5,
          ),
          Text("Haliz Najibi",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: dark,
              ))),
          SizedBox(
            height: 24,
          ),
          Stack(
            children: [
              Container(
                height: 130,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("assets/svg/last_read.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("Last Read",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Al-Fatiah",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                      const SizedBox(
                        height: 3,
                      ),
                      Text("Ayah No:1",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white))),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset("assets/img/quran.png"))
            ],
          )
        ],
      ),
    );
  }
}
