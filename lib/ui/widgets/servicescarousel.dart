import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicesCarousel extends StatelessWidget {
  ServicesCarousel({
    Key key,
    @required this.services,
  }) : super(key: key);

  final List services;
  final List<IconData> faIcons = [
    FontAwesomeIcons.briefcase,
    FontAwesomeIcons.cogs,
    FontAwesomeIcons.objectGroup
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 600),
        autoPlayInterval: Duration(seconds: 15),
        autoPlayCurve: Curves.easeInOut,
        viewportFraction: 0.9,
        enlargeCenterPage: true,
        items: services == null
            ? [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                          height: 200,
                          color: Colors.white.withOpacity(0.2),
                          margin: EdgeInsets.all(10)),
                    );
                  },
                );
              }).toList()
            : services
                .asMap()
                .map((i, item) {
                  return MapEntry(i, Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(item['image']),
                                      fit: BoxFit.fill)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Icon(faIcons[i],
                                            color: Colors.white, size: 20),
                                      ),
                                      Text(
                                        item['service'],
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60),
                                    child: Divider(
                                        color: Colors.white, thickness: 1),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      item['description'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                    },
                  ));
                })
                .values
                .toList());
  }
}
