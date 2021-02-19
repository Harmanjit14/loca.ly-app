import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:localy/screens/places.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Holder extends StatefulWidget {
  @override
  _HolderState createState() => _HolderState();
}

enum _SelectedTab { home, jobs, search, profile }
var _selectedTab = _SelectedTab.home;

class _HolderState extends State<Holder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.amber,
    ];
    List<String> title = ["loca.ly", "Find Rooms", "Find Jobs", "My Profile"];
    List<SalomonBottomBarItem> items = [
      SalomonBottomBarItem(
        icon: Icon(Icons.home),
        title: Text("Home"),
        selectedColor: Colors.pink,
      ),

      /// Likes
      SalomonBottomBarItem(
        icon: Icon(Icons.now_widgets),
        title: Text("Buy/Rent"),
        selectedColor: Colors.teal,
      ),

      /// Search
      SalomonBottomBarItem(
        icon: Icon(Icons.group),
        title: Text("Jobs"),
        selectedColor: Colors.cyan,
      ),

      /// Profile
      SalomonBottomBarItem(
        icon: Icon(Icons.person),
        title: Text("Profile"),
        selectedColor: Colors.amber,
      ),
    ];
    void _handleIndexChanged(int i) {
      setState(() {
        _selectedTab = _SelectedTab.values[i];
      });
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(
                Icons.exit_to_app_rounded,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
        title: Text(
          title[_selectedTab.index],
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: color[_selectedTab.index],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: items,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    switch (_selectedTab.index) {
      case 0:
        return Container();
        break;
      case 1:
        return PlacesScreen();
        break;
      case 2:
        return Container();
        break;
      case 3:
        return Container();
        break;
      default:
    }
    return Container();
  }
}
