import 'package:flutter/material.dart';

class RecentPostsScreen extends StatelessWidget {
  static const routeName = "/recent_posts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent posts'),
      ),
    );
  }
}