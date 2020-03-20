import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_sort/ui/utils/refs.dart';

class BenefitsGridView extends StatelessWidget {
  BenefitsGridView({
    Key key,
    @required this.benefits,
  }) : super(key: key);

  final List benefits;
  final List<IconData> faIcons = [
    FontAwesomeIcons.solidLaughBeam,
    FontAwesomeIcons.bolt,
    FontAwesomeIcons.stopwatch,
    FontAwesomeIcons.commentsDollar,
    FontAwesomeIcons.stackExchange,
    FontAwesomeIcons.question,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: benefits == null
            ? [1, 2, 3, 4, 5, 6].map((item) {
                return Text('item');
              }).toList()
            : benefits.asMap().map((i,item) {
                return MapEntry(i, Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        color: Shades.lightGrey,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(faIcons[i], size: 60, color: Shades.spaceBlue),
                              ),
                              Text("${item['benefit']}",
                              textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    back: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: Container(
                        color: Colors.black,
                        child: Stack(
                          children: <Widget>[
                            Center(child: Icon(faIcons[i], size: 100, color: Colors.white24,)),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${item['description']}",
                                textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
              }).values.toList());
  }
}
