import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:quick_sort/ui/utils/refs.dart';

class MockTestsGrid extends StatelessWidget {
  const MockTestsGrid({
    Key key,
    @required this.mockTests,
    @required this.contests,
    @required this.pastTests,
    @required this.upcomingTests,
  }) : super(key: key);

  final Map mockTests;
  final List contests;
  final List pastTests;
  final List upcomingTests;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          child: Column(
            children: <Widget>[
              Text("${mockTests['subtitle']}",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: Text("${mockTests['contests']['title']}",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: contests
                      .asMap()
                      .map((i, item) {
                        return MapEntry(
                            i,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlipCard(
                                direction: FlipDirection.HORIZONTAL,
                                front: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Image.network(
                                      item['image'],
                                      fit: BoxFit.fill,
                                    )),
                                back: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              item['type'] == 'leaderboard'
                                                  ? Text(
                                                      'Leaderboard',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    )
                                                  : Utils.emptyWidget,
                                              item['type'] == 'leaderboard'
                                                  ? Divider(thickness: 1)
                                                  : Utils.emptyWidget,
                                              Text(
                                                item['text'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ))),
                              ),
                            ));
                      })
                      .values
                      .toList()),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: Text("${mockTests['past_tests']['title']}",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: pastTests
                      .asMap()
                      .map((i, item) {
                        return MapEntry(
                            i,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlipCard(
                                direction: FlipDirection.HORIZONTAL,
                                front: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Image.network(
                                      item['image'],
                                      fit: BoxFit.fill,
                                    )),
                                back: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              item['type'] == 'leaderboard'
                                                  ? Text(
                                                      'Leaderboard',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    )
                                                  : Utils.emptyWidget,
                                              item['type'] == 'leaderboard'
                                                  ? Divider(thickness: 1)
                                                  : Utils.emptyWidget,
                                              Text(
                                                item['text'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ))),
                              ),
                            ));
                      })
                      .values
                      .toList()),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: Text("${mockTests['upcoming_tests']['title']}",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: upcomingTests
                      .asMap()
                      .map((i, item) {
                        return MapEntry(
                            i,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlipCard(
                                direction: FlipDirection.HORIZONTAL,
                                front: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Image.network(
                                      item['image'],
                                      fit: BoxFit.fill,
                                    )),
                                back: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              item['type'] == 'leaderboard'
                                                  ? Text(
                                                      'Leaderboard',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    )
                                                  : Utils.emptyWidget,
                                              item['type'] == 'leaderboard'
                                                  ? Divider(thickness: 1)
                                                  : Utils.emptyWidget,
                                              Text(
                                                item['text'],
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ))),
                              ),
                            ));
                      })
                      .values
                      .toList())
            ],
          ),
        ),
      ),
    );
  }
}
