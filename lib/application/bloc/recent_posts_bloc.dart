import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:wordaction/application/bloc/bloc_base.dart';
import 'package:wordaction/application/model/pagination.dart';
import 'package:wordaction/domain/model/post.dart';
import 'package:wordaction/infrastructure/repositories/post_repository_base.dart';
import 'package:rxdart/rxdart.dart';

class RecentPostsBloc extends BlocBase {
  static final _state$ = StreamController<RecentPostsState>();
  final pagination$ = StreamController<Pagination>();
  final Stream<RecentPostsState> _stateStream$;
  final PostRepositoryBase _postRepository;
  RecentPostsState _currentState;

  Stream<RecentPostsState> get state$ => _stateStream$;

  RecentPostsState get currentState => _currentState;

  RecentPostsBloc({@required postRepository})
      : _postRepository = postRepository,
        _stateStream$ = _state$.stream.asBroadcastStream();

  @override
  void init() {
    state$.listen((state) => _currentState = state);
    pagination$.stream.switchMap((pagination) async* {
      if (_currentState != null) {
        yield _currentState.copyWith(isLoading: true);
      }
      var posts = await _postRepository.getRecent(pagination);
      yield RecentPostsState(
          isLoading: false, posts: posts, pagination: pagination);
    }).listen((state) => _state$.add(state));
    pagination$.add(Pagination());
  }

  @override
  void dispose() {
    pagination$.close();
    _state$.close();
  }
}

@immutable
class RecentPostsState {
  final Pagination pagination;
  final List<Post> posts;
  final bool isLoading;

  RecentPostsState(
      {@required this.pagination,
      @required this.posts,
      @required this.isLoading});

  RecentPostsState copyWith(
      {Pagination pagination, List<Post> posts, bool isLoading}) {
    return RecentPostsState(
        pagination: pagination ?? this.pagination,
        posts: posts ?? this.posts,
        isLoading: isLoading ?? this.isLoading);
  }
}
