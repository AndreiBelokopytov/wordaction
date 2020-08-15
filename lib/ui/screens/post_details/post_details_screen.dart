import 'package:flutter/material.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = "/post_details";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
    );
  }
}
