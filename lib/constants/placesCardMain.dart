import 'package:flutter/material.dart';
import 'package:localy/constants/text.dart';

Widget placeCard(Size size) {
  return Container(
    height: 200,
    width: size.width * 0.9,
    decoration: BoxDecoration(
        color: Colors.teal, borderRadius: BorderRadius.circular(20)),
    child: Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            child: Container(
              height: 200,
              width: 170,
              child: Image.network(
                "https://upload-system-bucket.s3.ap-south-1.amazonaws.com/uploads/e2a174e0-d78e-444c-b257-d600cf6d4596.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width:8),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              normalText("Text Here", 20, Colors.black)
            ],
          ),
        ],
      ),
    ),
  );
}
