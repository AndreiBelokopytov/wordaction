import 'package:flutter/material.dart';
import 'package:wordaction/application/bloc/recent_posts_bloc.dart';
import 'package:wordaction/service_locator.dart';
import 'package:wordaction/ui/widgets/post_list.dart';

class RecentPostsScreen extends StatefulWidget {
  static const routeName = '/recent_posts';

  @override
  State createState() {
    return _RecentPostsScreenState();
  }
}

class _RecentPostsScreenState extends State<RecentPostsScreen> {
  final recentPostsBloc = ServiceLocator.sl.get<RecentPostsBloc>();

  @override
  void initState() {
    super.initState();
    recentPostsBloc.init();
  }

  @override
  void dispose() {
    super.dispose();
    recentPostsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новое'),
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: recentPostsBloc.state$,
          builder: (context, snapshot) {
            if (snapshot != null && snapshot.hasData) {
              var state = snapshot.data as RecentPostsState;
              return PostList(posts: state.posts, isLoading: state.isLoading);
            }
            return Center(
              child: Text('Загрузка...'),
            );
          },
        ),
      ),
    );
  }
}