import 'package:flutter/material.dart';
import 'surah.dart';

class ContentTab extends StatelessWidget {
  const ContentTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(children: [
        Surah(),
        Text("todo"),
        Text("todo"),
        Text("todo"),
      ]),
    );
  }
}
