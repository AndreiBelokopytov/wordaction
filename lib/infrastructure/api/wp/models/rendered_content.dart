import 'package:flutter/material.dart';

@immutable
class RenderedContent {
  final String rendered;

  RenderedContent.fromJSON(Map<String, dynamic> rawData): rendered = rawData['rendered'];
}