import 'dart:convert';
import 'package:alquran/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../globals.dart';
import '../screens/surah_screen.dart';

class Surah extends StatelessWidget {
  const Surah({
    super.key,
  });
  Future<List<SurahModedl>> _getSurah() async {
    final response = await rootBundle.loadString("assets/data/list_surah.json");
    final data = jsonDecode(response) as List<dynamic>;
    return data
        .map((json) => SurahModedl.fromJson(json as Map<String, dynamic>))
        .toList();
    // return SurahModedl.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: FutureBuilder<List<SurahModedl>>(
        future: _getSurah(),
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("ada error : ${snapshot.error}"),
            );
          }
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final result = snapshot.data!.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      int nomor = result.nomor;
                      print(result.nomor);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahScreen(
                              nomor: nomor,
                              namaIndonesia: result.namaLatin,
                              arti: result.arti,
                              turun: result.tempatTurun,
                              ayat: result.jumlahAyat,
                            ),
                          ));
                    },
                    child: ListTile(
                      leading: Container(
                        width: 36,
                        height: 36,
                        child: Stack(
                          children: [
                            SvgPicture.asset("assets/svg/tes.svg"),
                            Center(
                              child: Text("${index + 1}",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ))),
                            ),
                          ],
                        ),
                      ),
                      title: Text("${result.namaLatin}",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: dark,
                          ))),
                      subtitle: Row(
                        children: [
                          Text("${result.tempatTurun}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: secondary,
                              ))),
                          Text(" ${result.jumlahAyat}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: secondary,
                              ))),
                        ],
                      ),
                      trailing: Text("${result.nama}",
                          style: GoogleFonts.amiri(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primary)),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: snapshot.data!.length);
          }
          return Container();
        },
      ),
    );
  }
}
