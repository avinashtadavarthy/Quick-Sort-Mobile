import 'package:flutter/material.dart';
import 'package:quick_sort/ui/utils/refs.dart';

class SingleExperience extends StatelessWidget {
  final Map singleItem;
  final String heroTag;
  SingleExperience({Key key, @required this.singleItem, @required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> getTexts() {
      List<TextSpan> textSpans = new List();

      for (var i = 0; i < singleItem['experience'].length; i++) {
        Map item = singleItem['experience'][i];
        textSpans.addAll([
          TextSpan(text: item['type'] == 'head' ? '\n' : ''),
          TextSpan(
              text: item['text'],
              style: item['type'] == 'head'
                  ? TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                  : TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          TextSpan(text: '\n\n')
        ]);
      }

      return textSpans;
    }

    return Scaffold(
      backgroundColor: Shades.midnightBlue,
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('${singleItem['name']}'),
            Text('Interview Experience', style: TextStyle(fontSize: 14)),
          ],
        ),
        centerTitle: true,
        backgroundColor: Shades.midnightBlue,
        elevation: 0,
      ),
      body: Center(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Hero(
                tag: heroTag,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    child: Image.network(
                      singleItem['image'],
                      fit: BoxFit.fill,
                    ))),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                    style:
                        TextStyle(fontFamily: 'Quicksand', color: Colors.white),
                    children: getTexts()),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
