import 'package:alquran/globals.dart';
import 'package:alquran/screens/home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Quran App",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  )),
                ),
                Text(
                  "Learn Quran and Recite once everyday",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: secondary,
                  )),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 314,
                      height: 450,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset("assets/img/splash.png"),
                    ),
                    Positioned(
                      bottom: -23,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            )),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 17),
                            decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text("Get Started",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ))),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
