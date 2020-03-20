import 'package:flutter/material.dart';
import 'package:quick_sort/ui/screens/tabs/singleexperience.dart';

class ExperiencesGrid extends StatelessWidget {
  const ExperiencesGrid({
    Key key,
    @required this.experiences,
  }) : super(key: key);

  final List experiences;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: experiences
            .asMap()
            .map((i, item) {
              return MapEntry(
                  i,
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleExperience(singleItem: item, heroTag: 'expand$i')));
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Hero(
                                  tag: 'expand$i',
                                  child: Image.network(
                                    item['image'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 9, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("${item['name']}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Text(
                                          "${item['position']}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        )),
                  ));
            })
            .values
            .toList());
  }
}
