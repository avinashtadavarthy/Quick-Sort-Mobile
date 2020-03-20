import 'package:flutter/material.dart';
import 'package:quick_sort/ui/utils/refs.dart';

class About extends StatelessWidget {
  final Map pageData;
  About({Key key, @required this.pageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Shades.midnightBlue,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'About Us',
              style: TextStyle(fontSize: 24),
            ),
          ),
          centerTitle: true,
          backgroundColor: Shades.midnightBlue,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    pageData['start_image'],
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Text(pageData['content'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: Image.network(
                    pageData['end_image'],
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ));
  }
}
