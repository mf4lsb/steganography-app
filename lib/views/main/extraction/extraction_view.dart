import 'package:flutter/material.dart';

class ExtractionView extends StatelessWidget {
  const ExtractionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Colors.amber,
        child: const Text(
          'Page 3',
          style: TextStyle(fontSize: 50, color: Colors.black),
        ));
  }
}
