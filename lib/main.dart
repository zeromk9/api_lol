import 'package:flutter/material.dart';
import 'package:api_lol/models/models.dart';
import 'package:api_lol/providers/providers.dart';
import 'package:api_lol/screens/screens.dart';
import 'package:api_lol/widgets/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Vacía'),
        ),
        body: Container(),
      ),
    );
  }
}
