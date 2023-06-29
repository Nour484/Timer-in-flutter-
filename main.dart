import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lifecycle/nextscreen.dart';

//* createState()
//? mounted == true
//* initState()
// didChangeDependencies()
//* build()
// didUpdateWidget()
//* setState()
// deactivate()
//* dispose()
//? mounted == false
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // ignore: avoid_print
    print("initState");
    startTimer();
    super.initState();
  }

  int counter = 30;

  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // ignore: avoid_print
      print(timer.tick);
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$counter",
            style: const TextStyle(fontSize: 40),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const NextScreen()));
              },
              child: const Text("NextScreen", style: TextStyle(fontSize: 20)))
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print("dispose");
    _timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
