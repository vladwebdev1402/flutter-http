import 'package:flutter/material.dart';
import 'package:laba_http/screens/main_screen_provider.dart';

void main() => runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreenProvider(),
    ));
