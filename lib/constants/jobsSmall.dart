import 'package:flutter/material.dart';
import 'package:localy/constants/text.dart';

Widget smallCardJ() {
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
              "https://upload-system-bucket.s3.ap-south-1.amazonaws.com/uploads/e2a174e0-d78e-444c-b257-d600cf6d4596.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 3),
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
            alignment: Alignment.centerLeft,
            child: normalText("title", 15, Colors.black)),
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
            alignment: Alignment.centerLeft,
            child: normalText("Duration : 2 Months", 11, Colors.black)),
        Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 15),
            alignment: Alignment.centerLeft,
            child: boldText("Pay : 20000", 14, Colors.black))
      ],
    ),
  );
}