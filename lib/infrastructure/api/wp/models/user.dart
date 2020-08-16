import 'package:flutter/material.dart';

@immutable
class User {
  final int id;
  final String name;
  final Map<String, String> avatarUrls;

  User.fromJSON(Map<String, dynamic> rawData)
      : id = rawData['id'],
        name = rawData['name'],
        avatarUrls = (rawData['mpp_avatar'] as Map<String, dynamic>)
            .cast<String, String>();
}
