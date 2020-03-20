import 'package:flutter/material.dart';
import 'package:quick_sort/ui/utils/refs.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickExplore extends StatefulWidget {
  final Map pageData;
  QuickExplore({Key key, @required this.pageData}) : super(key: key);

  @override
  _QuickExploreState createState() => _QuickExploreState();
}

class _QuickExploreState extends State<QuickExplore> {
  List<Widget> _contentList() {
    List<Widget> contents = new List();

    for (int i = 0; i < widget.pageData['content'].length; i++) {
      Map item = widget.pageData['content'][i];
      contents.add(
        InkWell(
          onTap: () => _launchURL(item['url']),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                elevation: 10,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        Text(item['caption'],
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16)),
                        Text("${item['date']}  |  ${item['time']}",
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                        Stack(
                          children: <Widget>[
                            Image.network(item['thumbnail_url']),
                            Positioned.fill(
                                child: Icon(
                              Icons.play_arrow,
                              size: 70,
                              color: Colors.black,
                            )),
                            Positioned.fill(
                                child: Icon(
                              Icons.play_circle_filled,
                              size: 70,
                              color: Colors.white,
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return contents;
  }

  _launchURL(String linkedinURL) async {
    final url = linkedinURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Shades.midnightBlue,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Quick Explore',
              style: TextStyle(fontSize: 24),
            ),
          ),
          centerTitle: true,
          backgroundColor: Shades.midnightBlue,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${widget.pageData['title']}",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  height: 16,
                ),
                Text("\"${widget.pageData['subtitle']}\"",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.white)),
                SizedBox(
                  height: 16,
                ),
                Column(children: _contentList()),
              ],
            ),
          ),
        ));
  }
}
