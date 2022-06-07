import 'package:bacuy_app/color/customColor.dart';
import 'package:bacuy_app/data/dataBooks.dart';
import 'package:bacuy_app/ui/detailPage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ComplicatedImageDemo extends StatelessWidget {
  const ComplicatedImageDemo({Key? key, required this.item}) : super(key: key);

  final List<DataBooks> item;

  List<Widget> getImageSliders(BuildContext context) {
    return popularBooks
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
              child: Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.network(
                        item.image,
                        fit: BoxFit.cover,
                        height: 500,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(50, 255, 255, 255),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            padding: EdgeInsets.all(8),
                            child: Text(
                              item.title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(50, 255, 255, 255),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  item.author,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  item.rate,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: textOrange,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
      child: Container(
        child: GestureDetector(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.0,
              enlargeCenterPage: true,
            ),
            items: getImageSliders(context),
          ),
        ),
      ),
    );
  }
}
