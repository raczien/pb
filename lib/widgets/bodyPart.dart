import 'package:flutter/material.dart';

import 'MyPainter.dart';

class BodyPart extends StatefulWidget {
  @override
  _BodyPartState createState() => _BodyPartState();
}

class _BodyPartState extends State<BodyPart> {
  CustomPainter x = RPSCustomPainter();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 200 / (200 * 1.7415307402760352),
        child: InkWell(
          onTap: () {
            setState(() {

              print('update value');
            });
          },
          child: CustomPaint(
            size: Size(
                200,
                (200 * 1.7415307402760352)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: x,
          ),
        ),
      ),
    );
  }
}
