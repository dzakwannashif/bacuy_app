import 'package:bacuy_app/color/customColor.dart';
import 'package:bacuy_app/data/dataBooks.dart';
import 'package:bacuy_app/ui/plus/historyBooks.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'History',
          style: TextStyle(
              color: textOrange,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins'),
        ),
      ),
      body: SingleChildScrollView(
        child: HistoryBook(
          item: historyBooks,
        ),
      ),
    );
  }
}
