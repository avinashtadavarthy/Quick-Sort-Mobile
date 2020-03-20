import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_sort/ui/widgets/benefitsgrid.dart';
import 'package:quick_sort/ui/widgets/servicescarousel.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List services, benefits;

  Future<String> loadJsonAsset() async {
    return await rootBundle.loadString('assets/data/home.json');
  }

  Future loadJson() async {
    String jsonString = await loadJsonAsset();
    Map jsonResponse = json.decode(jsonString);

    setState(() {
      this.services = jsonResponse['services'];
      this.benefits = jsonResponse['benefits'];
    });
    // print(services[0].toString());
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
                      padding: const EdgeInsets.only(left: 28, top: 40),
                      child: Text(
                        'Services',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ServicesCarousel(services: services),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28, top: 30),
                      child: Text(
                        'Benefits',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BenefitsGridView(benefits: benefits),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}