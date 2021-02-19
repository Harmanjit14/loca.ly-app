import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PlacesScreen extends StatelessWidget {
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: Colors.orangeAccent,
      backgroundColor: Colors.white,
      key: _refreshIndicatorKey,
        child: ListView(
          children: [],
        ),
        onRefresh: () async {
          return;
        });
  }
}
