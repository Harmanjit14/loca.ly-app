import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:localy/constants/text.dart';
import 'package:localy/server/location.dart';
import 'package:localy/server/rating.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int res = 0;
  Widget card(String location, int rating) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      margin: EdgeInsets.fromLTRB(20, 6, 20, 6),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          boldText(location, 16, Colors.black),
          SizedBox(width: 15),
          normalText((rating < 0) ? "Status : good" : "Status : not good", 13,
              Colors.black)
        ],
      ),
    );
  }

  Future<void> boxes() async {
    res = await getallLocs("none");
    ;
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
    return Container(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 24,
                ),
                SizedBox(width: 5),
                Container(
                  child: normalText("Curently at : ", 14, Colors.grey[600]),
                ),
                SizedBox(width: 5),
                Container(
                  child: normalText(
                      (placemarks.isNotEmpty)
                          ? (placemarks[0].street +
                              " " +
                              placemarks[0].subLocality +
                              " " +
                              placemarks[0].locality)
                          : "No location found!",
                      14,
                      Colors.grey[600]),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
            alignment: Alignment.centerLeft,
            child: normalText("My Area Status :", 20, Colors.black),
          ),
          boldText("Your Area is safe for all!", 30, Colors.green),
          SizedBox(height: 15),
          Divider(),
          Container(
            margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
            alignment: Alignment.centerLeft,
            child: normalText("All Rankings :", 14, Colors.black),
          ),
          Expanded(
              child: (res == 0)
                  ? Center(
                      child: SpinKitPouringHourglass(
                        color: Colors.pink,
                      ),
                    )
                  : ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: (allLocs.length < 7) ? allLocs.length : 7,
                      itemBuilder: (context, int index) {
                        String loc = allLocs[index]["city"];
                        int rat = allLocs[index]["rating"];
                        return card(loc, rat);
                      },
                    )),
        ],
      ),
    );
  }
}
