// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:alquran/model/ayat.dart';

class SurahModedl {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  List<Ayat>? ayat;
  SurahModedl(
      {required this.nomor,
      required this.nama,
      required this.namaLatin,
      required this.jumlahAyat,
      required this.tempatTurun,
      required this.arti,
      required this.deskripsi,
      this.ayat});
  factory SurahModedl.fromJson(Map<String, dynamic> json) {
    return SurahModedl(
        nomor: json['nomor'] ?? 0,
        nama: json['nama'] ?? '',
        namaLatin: json['namaLatin'] ?? '',
        jumlahAyat: json['jumlahAyat'] ?? '',
        tempatTurun: json['tempatTurun'] ?? '',
        arti: json['arti'] ?? '',
        deskripsi: json['deskripsi'] ?? '',
        ayat: json.containsKey('ayat')
            ? List<Ayat>.from(json['ayat']!.map((a) => Ayat.fromJson(a)))
            : null);
  }

  @override
  String toString() {
    return 'SurahModedl(nomor: $nomor, nama: $nama, namaLatin: $namaLatin, jumlahAyat: $jumlahAyat, tempatTurun: $tempatTurun, arti: $arti, deskripsi: $deskripsi, ayat: $ayat)';
  }
}
