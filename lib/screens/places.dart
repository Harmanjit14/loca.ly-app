import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localy/constants/placesmall.dart';
import 'package:localy/constants/text.dart';
import 'package:localy/screens/placesExpanded.dart';
import 'package:localy/server/pgSQL.dart';
import 'package:localy/server/location.dart';

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final controller = new TextEditingController();
  int nearMe = 0;

  final scrollController = new ScrollController();

  Future<void> boxes() async {
    nearMe = await getsearchJobs("${placemarks[0].locality.toString()}");
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
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      primary: true,
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          Container(
            width: size.width * 0.9,
            child: TextField(
              keyboardType: TextInputType.text,
              style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey[800]),
              onEditingComplete: () {
                Navigator.pushNamed(context, "/pE");
              },
              onChanged: (value) {
                searchPlaces = value;
              },
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "Search for rooms",
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.teal[700], width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.teal[700], width: 2),
                  ),
                  fillColor: Colors.grey[100]),
            ),
          ),
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
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.near_me,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(width: 5),
                boldText("Places near me!", 24, Colors.black),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              height: 200,
              child: (nearMe == 1)
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (alljobsHome.length < 7) ? alljobsHome.length : 7,
                      shrinkWrap: true,
                      itemBuilder: (context, int index) {
                        int rent = alljobsHome[index]["rent"];
                        String room = alljobsHome[index]["roomtype"];
                        String loc = alljobsHome[index]["location"];
                        String url = alljobsHome[index]["url"];
                        return smallCard(rent, room, loc, url);
                      },
                    )
                  : SpinKitDualRing(color: Colors.teal)),
          Divider(),
        ],
      ),
    );
  }
}
