import 'package:flutter/material.dart';

class AppBarlayout extends StatelessWidget {
  static const String _title = 'Flutter Modal Sample';
  const AppBarlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // AppBar(title: const Text(_title));
    Container(
      alignment: Alignment.centerLeft,
        // color: Colors.blue,
        margin: const EdgeInsets.only(top: 40.0, left: 15.0),
        child: const SizedBox(
          height: 32.0,
          child: Text(
            _title,
            style: TextStyle(color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            ),
          ),
        ));
  }
}
