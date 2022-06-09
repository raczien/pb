import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_drawing/path_drawing.dart';

class Shape {
  final Path _path;

  Path get path => _path;
  final String _label;
  final Color _color = Colors.grey.shade500;
  late Path _transformedPath;

  Color get color => _color;
  String get label => _label;
  Path get transformedPath => _transformedPath;

  Shape(strPath, this._label) : _path = parseSvgPathData(strPath);

  void transform(Matrix4 matrix) =>
      _transformedPath = _path.transform(matrix.storage);
}
