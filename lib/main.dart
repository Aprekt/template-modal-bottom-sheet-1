//* @aprekt.dev
//* Complete code on github
//* link in bio

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Modal Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff005b7f),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const ModalBottomSheet(),
      ),
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Open BottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            backgroundColor: Colors.transparent,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF3366FF),
                        Color(0xFF00CCFF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // begin:  FractionalOffset(0.0, 0.0),
                      // end:  FractionalOffset(1.0, 0.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Modal BottomSheet',
                        style: TextStyle(color: Colors.white),
                      ),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
