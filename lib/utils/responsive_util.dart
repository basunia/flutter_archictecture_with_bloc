import 'package:flutter/material.dart';

extension OrientationX on Orientation {
  bool get isLandScape => this == Orientation.landscape;
}
