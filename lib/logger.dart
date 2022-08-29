import 'package:flutter/material.dart';

class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(json) => Logger(json['name']);

  Logger._internal(this.name) {
    Logger(')');
  }

  Logger.external(this.name);

  Logger logger = Logger._internal(')))');
}
