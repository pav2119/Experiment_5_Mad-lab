import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//It is the entry point for your Flutter app.
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multiple Gestures Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Multiple Gestures Demo'),
        ),
        body: DemoApp(),
      ),
    ),
  );
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            AllowMultipleGestureRecognizer>(
          () => AllowMultipleGestureRecognizer(),
          (AllowMultipleGestureRecognizer instance) {
            instance.onTap = () => print('It is the parent container gesture');
          },
        )
      },
      behavior: HitTestBehavior.opaque,
      //Parent Container
      child: Container(
        color: Colors.pink.shade50,
        child: Center(
          //Now, wraps the second container in RawGestureDetector
          child: RawGestureDetector(
            gestures: {
              AllowMultipleGestureRecognizer:
                  GestureRecognizerFactoryWithHandlers<
                      AllowMultipleGestureRecognizer>(
                () => AllowMultipleGestureRecognizer(), //constructor
                (AllowMultipleGestureRecognizer instance) {
                  //initializer
                  instance.onTap = () => print('It is the nested container');
                },
              )
            },
            //Creates the nested container within the first.
            child: Container(
              color: Colors.pink.shade300,
              width: 250.0,
              height: 350.0,
            ),
          ),
        ),
      ),
    );
  }
}

class AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
