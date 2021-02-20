import 'package:flutter/material.dart';
import 'package:localy/constants/placesCardMain.dart';
import 'package:localy/screens/holder.dart';
import 'package:localy/screens/login.dart';
import 'package:localy/screens/placesExpanded.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'loc.ly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Auth(),
        "/home": (context) => Holder(),
        "/room": (context) => PlacesExpanded(),
        "/pE": (context) => PlacesExpanded(),
      },
    );
  }
}
