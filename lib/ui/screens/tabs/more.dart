import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_sort/ui/screens/tabs/morescreens/about.dart';
import 'package:quick_sort/ui/screens/tabs/morescreens/ourteam.dart';
import 'package:quick_sort/ui/screens/tabs/morescreens/quickexplore.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  Map quickExplorePage, aboutPage, ourTeamPage;
  List optionsList;

  Future<String> loadJsonAsset() async {
    return await rootBundle.loadString('assets/data/more.json');
  }

  Future loadJson() async {
    String jsonString = await loadJsonAsset();
    Map jsonResponse = json.decode(jsonString);

    setState(() {
      this.optionsList = jsonResponse['options_list'];
      this.quickExplorePage = jsonResponse['quick_explore_page'];
      this.aboutPage = jsonResponse['about_page'];
      this.ourTeamPage = jsonResponse['our_team_page'];
    });
  }

  @override
  void initState() {
    this.loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Colors.transparent,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: optionsList == null
                ? Text("loading...")
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                    itemCount: optionsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          focusColor: Colors.indigo,
                          onTap: () {
                            switch (optionsList[index]) {
                              case "Quick Explore":
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => QuickExplore(pageData: quickExplorePage)));
                                break;
                              case "About":
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => About(pageData: aboutPage)));
                                break;
                              case "Our Team":
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OurTeam(pageData: ourTeamPage)));
                                break;
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              height: 50,
                              color: Colors.white,
                              child: Center(
                                  child: Text(
                                    '${optionsList[index]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  )),
                            ),
                          ),
                        ),
                      );
                    }),
          )),
    );
  }
}
