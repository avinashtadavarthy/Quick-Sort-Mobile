import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MockInterviewsLayout extends StatelessWidget {
  const MockInterviewsLayout({
    Key key,
    @required this.mockInterviews,
  }) : super(key: key);

  final Map mockInterviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: mockInterviews == null
                        ? Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            color: Colors.white60)
                        : Image.network(
                            mockInterviews['image'],
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width / 2.5,
                          )),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mockInterviews == null
                        ? Container(color: Colors.white38)
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${mockInterviews['title']}",
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              SizedBox(
                                height: 16,
                              ),
                              Text("\"${mockInterviews['subtitle']}\"",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                              SizedBox(
                                height: 16,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: FlatButton(
                                  onPressed: _launchURL,
                                  color: Colors.black,
                                  splashColor: Colors.white38,
                                  child: Text("Register Here !",
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    final url = mockInterviews['form_link'];
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
