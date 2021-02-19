import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:localy/constants/text.dart';
import 'package:localy/server/location.dart';

class PlacesScreen extends StatelessWidget {
  final controller = new TextEditingController();
  final scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      child: Column(
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
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                          ? placemarks[0].toString()
                          : "No location found!",
                      14,
                      Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
