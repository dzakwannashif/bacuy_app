import 'package:flutter/material.dart';

import '../../color/customColor.dart';
import '../../data/dataBooks.dart';
import '../detailPage.dart';

class HistoryBook extends StatelessWidget {
  const HistoryBook({Key? key, required this.item}) : super(key: key);
  final List<DataBooks> item;

  List<Widget> historyBook(BuildContext context) {
    return historyBooks
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
              margin: EdgeInsets.only(
                  right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
              child: Container(
                height: 300,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(32)),
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
                            fontSize: 12),
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
                                    fontSize: 8,
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
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                ),
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
      height: MediaQuery.of(context).size.height,
      child: GestureDetector(
        child: Container(
          height: 300,
          child: GridView.builder(
            itemCount: historyBooks.length,
            itemBuilder: (_, index) {
              return historyBook(context)[index];
            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          ),
        ),
      ),
    );
  }
}
