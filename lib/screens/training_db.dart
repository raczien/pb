import 'package:flutter/material.dart';

import '../front_body.dart';

class Training_db extends StatelessWidget {
  const Training_db({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FrontBody(),
        ),
        TextButton(
          onPressed: () {
            FrontBodyPainter.addGroup();
          },
          child: Text('Core'),
        ),
        TextButton(
          onPressed: () {
            FrontBodyPainter.clearSelectedMuscles();
          },
          child: Text('Clear'),
        ),
      ],
    );
  }
}
