import 'package:flutter/material.dart';

@immutable
class Politician {
  final int id;
  final String name;
  final Map<String, String> avatarUrls;

  String get avatar48 =>
      avatarUrls['48'] ??
      'https://secure.gravatar.com/avatar/896a015383d473b234f99144da5def76?s=48&d=mm&r=g';

  Politician(
      {@required this.id, @required this.name, @required this.avatarUrls});
}
