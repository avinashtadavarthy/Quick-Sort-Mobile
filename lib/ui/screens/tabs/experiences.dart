import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_sort/ui/widgets/experiencesgrid.dart';

class Experiences extends StatefulWidget {
  @override
  _ExperiencesState createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  Map experiencesJson;
  List experiences;

  Future<String> loadJsonAsset() async {
    return await rootBundle.loadString('assets/data/experiences.json');
  }

  Future loadJson() async {
    String jsonString = await loadJsonAsset();
    Map jsonResponse = json.decode(jsonString);

    setState(() {
      this.experiencesJson = jsonResponse;
      this.experiences = jsonResponse['experiences'];
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'Interview Experiences',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: experiencesJson == null
                      ? Text('loading...')
                      : Text("\"${experiencesJson['subtitle']}\"",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                experiences == null
                    ? Text("loading...")
                    : ExperiencesGrid(experiences: experiences),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
