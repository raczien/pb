import 'package:flutter/material.dart';
import 'package:pb/back_body.dart';

import '../front_body.dart';

class Training_db extends StatefulWidget {
  const Training_db({Key? key}) : super(key: key);

  @override
  State<Training_db> createState() => _Training_dbState();
}

class _Training_dbState extends State<Training_db> {
  bool frontSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                frontSelected
                    ? Expanded(
                        child: FrontBody(),
                      )
                    : Expanded(
                        child: BackBody(),
                      ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: frontSelected
                            ? Colors.green.shade900
                            : const IconThemeData().color,
                        elevation: 6,
                        child: const Padding(
                            padding: EdgeInsets.all(5), child: Text('FRONT')),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            frontSelected = !frontSelected;
                          });
                        },
                        icon: const Icon(Icons.swap_horizontal_circle),
                      ),
                      Card(
                        color: !frontSelected
                            ? Colors.green.shade900
                            : const IconThemeData().color,
                        elevation: 6,
                        child: const Padding(
                            padding: EdgeInsets.all(5), child: Text('BACK')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'asda',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 20),
                ),
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
          ),
        ],
      ),
    );
  }
}
