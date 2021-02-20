import 'package:flutter/material.dart';
import 'package:localy/constants/text.dart';

Widget smallCardJ(int pay, String title, int rat) {
  String val = (rat<0)?"good":"not good";
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    height: 180,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey[300],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            height: 100,
            width: 200,
            child: Image.network(
              "https://www.roberthalf.com/sites/default/files/styles/full_width_content_image_1x_small_480/public/2020-05/Accounting-Skills-You-Need-to-Succeed-on-the-Job-AT-Blog-05-26-20.jpg?itok=LCiRwnsN",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 3),
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
            alignment: Alignment.centerLeft,
            child: normalText(title, 15, Colors.black)),
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
            alignment: Alignment.centerLeft,
            child: normalText("Security : "+val, 11, Colors.black)),
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
            alignment: Alignment.centerLeft,
            child: boldText("Pay : $pay", 14, Colors.black))
      ],
    ),
  );
}
