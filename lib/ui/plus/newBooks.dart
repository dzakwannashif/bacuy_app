import 'package:bacuy_app/color/customColor.dart';
import 'package:bacuy_app/data/dataBooks.dart';
import 'package:flutter/material.dart';

import '../detailPage.dart';

class NewBooks extends StatelessWidget {
  const NewBooks({Key? key, required this.item}) : super(key: key);
  final List<DataBooks> item;

  List<Widget> newBook(BuildContext context) {
    return newBooks
    .map(
      (item) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => DetailPage(item: item)),
            ),
          );
        },
        child: Container(
          margin:
              EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
          child: Container(
            height: 250,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
            child: Stack(
              children: [
                Center(
                  child: Image.network(
                    item.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 180,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    item.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            item.author,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            item.rate,
                            style: TextStyle(
                                color: textOrange,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    )
    .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Container(
          height: 300,
          child: ListView.builder(
              itemCount: newBooks.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return newBook(context)[index];
              }),
        ),
      ),
    );
  }
}
