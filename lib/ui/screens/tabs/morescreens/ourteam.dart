import 'package:flutter/material.dart';
import 'package:quick_sort/ui/utils/refs.dart';
import 'package:url_launcher/url_launcher.dart';

class OurTeam extends StatelessWidget {
  final Map pageData;
  OurTeam({Key key, @required this.pageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Shades.midnightBlue,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Meet Our Team',
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
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: pageData['team_members'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => _launchURL(
                          pageData['team_members'][index]['linkedin_url']),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  pageData['team_members'][index]['name'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    pageData['team_members'][index]['info'],
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Card(
                                elevation: 20.0,
                                child: Container(
                                  height: 135.0,
                                  width: 135.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 6.0,
                                          color: Colors.white,
                                          style: BorderStyle.solid),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          pageData['team_members'][index]
                                              ['image'],
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ));
  }

  _launchURL(String linkedinURL) async {
    final url = linkedinURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
