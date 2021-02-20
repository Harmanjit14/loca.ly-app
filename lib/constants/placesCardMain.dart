import 'package:flutter/material.dart';
import 'package:localy/constants/text.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Widget placeCard(
    Size size,
    String url,
    int rent,
    String room,
    String loc,
    String kitchen,
    String bathroom,
    String laundary,
    String name,
    String contact,
    BuildContext context) {
  return GestureDetector(
    onTap: () {
       Alert(
            context: context,
            type: AlertType.info,
            title: "Contact",
            desc: "Use this to contact the owner $name",
            buttons: [
              DialogButton(
                child: Text(
                  "Call",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                 
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
               DialogButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                 
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
            ],
          ).show();
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
      height: 200,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(20)),
      child: Container(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              child: Container(
                height: 200,
                width: 170,
                child: (url == null || url.isEmpty)
                    ? Image.network(
                        "https://upload-system-bucket.s3.ap-south-1.amazonaws.com/uploads/e2a174e0-d78e-444c-b257-d600cf6d4596.jpeg",
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                boldText("Rent : $rent", 20, Colors.white),
                normalText("Rooms : $room", 16, Colors.white),
                normalText("Location : $loc", 14, Colors.white),
                normalText("Kitchem : $kitchen", 14, Colors.grey[200]),
                normalText("Washroom : $bathroom", 14, Colors.grey[200]),
                normalText("Laundary : $laundary", 14, Colors.grey[200]),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

