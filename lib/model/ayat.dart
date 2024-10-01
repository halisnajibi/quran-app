// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ayat {
  int nomorAyat;
  String textArab;
  String textLatin;
  String textIndonesia;
  Ayat({
    required this.nomorAyat,
    required this.textArab,
    required this.textLatin,
    required this.textIndonesia,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
        nomorAyat: json['nomorAyat'] ?? 0,
        textArab: json['teksArab'] ?? 'kosong',
        textLatin: json['teksLatin'] ?? '',
        textIndonesia: json['teksIndonesia'] ?? '');
  }

  @override
  String toString() {
    return 'Ayat(nomorAyat: $nomorAyat, textArab: $textArab, textLatin: $textLatin, textIndonesia: $textIndonesia)';
  }
}
