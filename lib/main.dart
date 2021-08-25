import 'package:flutter/material.dart';
import 'package:shubhro_project/Const/constants.dart';
import 'package:shubhro_project/Pages/task2.dart';
import 'Pages/task1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLIGHTLOCAL',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HButton(
            name: 'Task1',
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Task1()));
            },
          ),
          HButton(
              name: 'Task2',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Task2()));
              })
        ],
      ),
    );
  }
}

class HButton extends StatelessWidget {
  final String name;
  final Function() onTap;
  const HButton({
    Key? key,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: onTap,
          child: Container(
              width: double.infinity,
              color: kMainColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  name,
                  style: kbasetxt.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ))),
    );
  }
}
