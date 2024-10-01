import 'dart:convert';
import 'package:alquran/globals.dart';
import 'package:alquran/model/surah.dart';
import 'package:alquran/widgets/appbar.dart';
import 'package:alquran/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../widgets/header_detail.dart';

class SurahScreen extends StatefulWidget {
  final String namaIndonesia;
  final String arti;
  final String turun;
  final int nomor;
  final int ayat;
  const SurahScreen({
    super.key,
    required this.namaIndonesia,
    required this.arti,
    required this.turun,
    required this.nomor,
    required this.ayat,
  });

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  Future<SurahModedl> getAyat() async {
    try {
      final responsen = await http
          .get(Uri.parse("https://equran.id/api/v2/surat/${widget.nomor}"));
      if (responsen.statusCode == 200) {
        final jsonData = json.decode(responsen.body)['data'];
        print(jsonData);
        return SurahModedl.fromJson(jsonData);
      } else {
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error: $e");
      throw Exception("Error fetching data");
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar("${widget.namaIndonesia}", "assets/svg/back.svg"),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderDetail(
                namaLatin: widget.namaIndonesia,
                arti: widget.arti,
                jumlahAyat: widget.ayat,
                turun: widget.turun,
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder<SurahModedl>(
                  future: getAyat(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      // Tangkap error dengan StackTrace
                      var error = snapshot.error;
                      var stackTrace =
                          snapshot.stackTrace ?? StackTrace.current;

                      print("Error: $error");
                      print("StackTrace: $stackTrace");

                      return Text("Ada error: $error\nLokasi: $stackTrace");
                    }
                    if (snapshot.hasData) {
                      // final result = snapshot.data;
                      // final ayat = result.ayat;

                      return Column(
                        children: [
                          ...List.generate(snapshot.data!.ayat!.length,
                              (index) {
                            final result =
                                snapshot.data!.ayat!.elementAt(index);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ContainerGrey(ayat: result.nomorAyat),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    " ${result.textArab}",
                                    style: GoogleFonts.amiri(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: dark),
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                Text(
                                    "${result.textIndonesia}"), // Ganti dengan isi ayat sesuai model
                              ],
                            );
                          }),
                        ],
                      );
                    }
                    return Container();
                  }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}

class ContainerGrey extends StatelessWidget {
  int ayat;
  ContainerGrey({
    super.key,
    required this.ayat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(30 / 2),
              ),
              child: Center(
                  child: Text("${ayat}",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))),
            ),
            Spacer(),
            SvgPicture.asset("assets/svg/share.svg"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SvgPicture.asset("assets/svg/play.svg"),
            ),
            SvgPicture.asset("assets/svg/bookmark_kecil.svg"),
          ],
        ),
      ),
    );
  }
}
