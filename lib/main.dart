import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wordaction/ui/screens/post_details/post_details_screen.dart';
import 'package:wordaction/ui/screens/recent_posts/recent_posts_screen.dart';

void main() {
  runApp(Wordaction());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
}

class Wordaction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RecentPostsScreen.routeName,
      routes: {
        RecentPostsScreen.routeName: (context) => RecentPostsScreen(),
        PostDetailsScreen.routeName: (context) => PostDetailsScreen()
      },
    );
  }
}