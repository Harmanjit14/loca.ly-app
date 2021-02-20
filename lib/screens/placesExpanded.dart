import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localy/constants/placesCardMain.dart';
import 'package:localy/constants/placesmall.dart';
import 'package:localy/constants/text.dart';
import 'package:localy/server/jobSQL.dart';

String searchPlaces = "";

class PlacesExpanded extends StatefulWidget {
  @override
  _PlacesExpandedState createState() => _PlacesExpandedState();
}

class _PlacesExpandedState extends State<PlacesExpanded> {
  int res = 0;
  Future<void> boxes() async {
    res = await getExpandedJobs(searchPlaces);
    setState(() {});
    print("home");
    return;
  }

  @override
  void initState() {
    boxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: normalText("Search Results", 20, Colors.black),
        ),
        body: (res == 0)
            ? Center(
                child: Container(
                  child: SpinKitDualRing(
                    color: Colors.teal,
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount:
                      (alljobsHome.length < 30) ? alljobsHome.length : 30,
                  itemBuilder: (context, int index) {
                    int rent = alljobsHome[index]["rent"];
                    String room = alljobsSearch[index]["roomtype"];
                    String loc = alljobsSearch[index]["location"];
                    String url = alljobsSearch[index]["url"];
                    String id = alljobsSearch[index]["id"];
                    String kitchen = alljobsSearch[index]["kitchenAvailable"];
                    String bathroom = alljobsSearch[index]["url"];
                    String laundary = alljobsSearch[index]["laundryIncluded"];
                    String name =
                        alljobsSearch[index]["createdBy"]["profile"]["name"];
                    String contact =
                        alljobsSearch[index]["createdBy"]["profile"]["mobile"];
                    return placeCard(size);
                  },
                ),
              ));
  }
}
