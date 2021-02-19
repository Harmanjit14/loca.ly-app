import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PlacesScreen extends StatelessWidget {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  final controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LiquidPullToRefresh(
        color: Colors.tealAccent,
        backgroundColor: Colors.white,
        key: _refreshIndicatorKey,
        child: Container(
          width: size.width,
          child: ListView(
            children: [
              SizedBox(height: 25),
              SizedBox(
                height: 80,
                width: size.width * 0.8,
                child: TextField(
                  onEditingComplete: () {},
                  onChanged: (value) {},
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      labelText: "Search for rooms",
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.teal[700], width: 2),
                      ),
                      fillColor: Colors.grey[100]),
                ),
              )
            ],
          ),
        ),
        onRefresh: () async {
          return;
        });
  }
}
