import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localy/constants/jobsSmall.dart';
import 'package:localy/constants/text.dart';
import 'package:localy/server/job.dart';
import 'package:localy/server/location.dart';

class JobScreen extends StatefulWidget {
  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final controller = new TextEditingController();

  int res = 0;
  Future<void> boxes() async {
    res = await getJobs("${placemarks[0].locality}");
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
                print("HO gaya!");
              },
              onChanged: (value) {},
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: "Search for jobs",
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.cyan[700], width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.cyan[700], width: 2),
                  ),
                  fillColor: Colors.grey[100]),
            ),
          ),
          Container(
            child: Container(
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
                boldText("Top Jobs!", 24, Colors.black),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            height: 200,
            child: (res == 0)
                ? SpinKitChasingDots(
                    color: Colors.cyan,
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: (myjobs.length < 7) ? myjobs.length : 7,
                    itemBuilder: (context, int index) {
                      int pay = myjobs[index]["pay"];
                      String title = myjobs[index]["title"];
                      int rat  = myjobs[index]["rating"]["rating"];
                      return smallCardJ(pay, title, rat);
                    },
                  ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
