import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'data.dart';

class FrontBody extends StatelessWidget {
  final notifier = ValueNotifier(Offset.zero);

  FrontBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) => notifier.value = e.localPosition,
      onPointerMove: (e) => notifier.value = e.localPosition,
      child: CustomPaint(
        painter: FrontBodyPainter(notifier),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class FrontBodyPainter extends CustomPainter {
  FrontBodyPainter(this._notifier) : super(repaint: _notifier);

  final ValueNotifier<Offset> _notifier;
  final Paint _paint = Paint();
  Size _size = Size.zero;
  static var _selectedMuscles = [];
  Offset lastNotifier = const Offset(0.0, 0.0);

  // list param - kann aus data.dart übergeben
  static void addGroup() {
    _selectedMuscles.add(frontBodyShapes[15]);
    _selectedMuscles.add(frontBodyShapes[16]);
    _selectedMuscles.add(frontBodyShapes[17]);
    _selectedMuscles.add(frontBodyShapes[18]);
    _selectedMuscles.add(frontBodyShapes[19]);
    _selectedMuscles.add(frontBodyShapes[20]);
    _selectedMuscles.add(frontBodyShapes[21]);
    _selectedMuscles.add(frontBodyShapes[22]);
  }

  static void clearSelectedMuscles() {
    _selectedMuscles.clear();
  }

  @override
  void paint(Canvas canvas, Size size) {
    //Redraw on resize
    var lastSize = _size;
    if (size != _size) {
      _size = size;
      final fs =
          applyBoxFit(BoxFit.contain, const Size(797.0000, 1388.0000), size);
      final r = Alignment.center.inscribe(fs.destination, Offset.zero & size);
      final matrix = Matrix4.translationValues(r.left, r.top, 0)
        ..scale(fs.destination.width / fs.source.width);
      for (var shape in frontBodyShapes) {
        shape.transform(matrix);
      }
    }
    canvas.clipRect(Offset.zero & size);
    for (var shape in frontBodyShapes) {
      if (lastSize == size &&
          _notifier.value != const Offset(0.0, 0.0) &&
          lastNotifier != _notifier.value) {
        if (shape.transformedPath.contains(_notifier.value)) {
          if (_selectedMuscles.contains(shape)) {
            //print("removing: ${shape._label}");
            _selectedMuscles.remove(shape);
          } else {
            //print("adding: ${shape._label}");
            _selectedMuscles.add(shape);
          }
        }
      }
    }
    lastNotifier = _notifier.value;
    for (var shape in frontBodyShapes) {
      final path = shape.transformedPath;
      //Draw all shapes
      _paint
        ..color = _selectedMuscles.contains(shape)
            ? Colors.teal.shade900
            : shape.color
        ..style = PaintingStyle.fill;
      canvas.drawPath(path, _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
