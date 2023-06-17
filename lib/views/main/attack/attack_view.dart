import 'package:flutter/material.dart';

class AttackView extends StatelessWidget {
  const AttackView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.blue,
        child: const Text(
          'Page 4',
          style: TextStyle(fontSize: 50, color: Colors.black),
        ));
  }
}
