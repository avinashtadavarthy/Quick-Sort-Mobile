import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_sort/ui/widgets/mockinterviews.dart';
import 'package:quick_sort/ui/widgets/mocktests.dart';

class Mocks extends StatefulWidget {
  @override
  _MocksState createState() => _MocksState();
}

class _MocksState extends State<Mocks> {
  Map mockInterviews, mockTests;
  List contests, pastTests, upcomingTests;

  Future<String> loadJsonAsset() async {
    return await rootBundle.loadString('assets/data/mocks.json');
  }

  Future loadJson() async {
    String jsonString = await loadJsonAsset();
    Map jsonResponse = json.decode(jsonString);

    setState(() {
      this.mockInterviews = jsonResponse['mock_interviews'];
      this.mockTests = jsonResponse['mock_tests'];
      this.contests = mockTests['contests']['tests'];
      this.pastTests = mockTests['past_tests']['tests'];
      this.upcomingTests = mockTests['upcoming_tests']['tests'];
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
              child: Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          'Mock Interviews',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  MockInterviewsLayout(mockInterviews: mockInterviews),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Text(
                          'Contests & Mock Tests',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                  mockTests == null
                      ? Text('Loading')
                      : MockTestsGrid(
                          mockTests: mockTests,
                          contests: contests,
                          pastTests: pastTests,
                          upcomingTests: upcomingTests),
                ],
              ),
            )),
      ),
    );
  }
}

