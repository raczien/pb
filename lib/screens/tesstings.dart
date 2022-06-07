import 'package:flutter/material.dart';

import '../models/body.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MusclePart> _pressedMuscles = [MusclePart.none];

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: 0.6, child: Stack(children: _buildMuscleList()));
  }

  List<Widget> _buildMuscleList() {
    List<Widget> muscles = [];
    for (int i = 0; i < MusclePart.values.length; i++) {
      muscles.add(_buildMuscles(MusclePart.values[i]));
    }
    return muscles;
  }

  Widget _buildMuscles(MusclePart musclePart) {
    return Container(
      child: ClipPath(
        clipper: PathClipper(musclePart),
        child: Stack(
          children: <Widget>[
            CustomPaint(
              painter: PathPainter(musclePart),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _musclePressed(musclePart),
                child: Container(
                    color: _pressedMuscles.contains(musclePart)
                        ? Colors.teal.shade900
                        : Colors.grey.shade500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _musclePressed(MusclePart musclePart) {
    print(musclePart);
    setState(() {
      if (!_pressedMuscles.contains(musclePart)) {
        _pressedMuscles.add(musclePart);
      } else if (_pressedMuscles.contains(musclePart) &&
          _pressedMuscles.length > 1) {
        _pressedMuscles.remove(musclePart);
      } else {
        _pressedMuscles = [MusclePart.none];
      }
    });
  }
}

class PathPainter extends CustomPainter {
  final MusclePart _musclePart;

  PathPainter(this._musclePart);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = getPathByMuscle(_musclePart);
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black
          ..strokeWidth = 2.0);
  }

  @override
  bool shouldRepaint(PathPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PathPainter oldDelegate) => true;
}

class PathClipper extends CustomClipper<Path> {
  final MusclePart _muscle;

  PathClipper(this._muscle);

  @override
  Path getClip(Size size) {
    return getPathByMuscle(_muscle);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
