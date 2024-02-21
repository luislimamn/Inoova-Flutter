import 'package:flutter/material.dart';
import 'package:inoova/telas/home_page.dart';

void main() => runApp(
    MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          //primaryColor: const Color(0xff795548),
          scaffoldBackgroundColor: Colors.white
      ),
    )
);