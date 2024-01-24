import 'package:flutter/material.dart';

class InoovaMapas extends StatefulWidget {
  const InoovaMapas({super.key});

  @override
  State<InoovaMapas> createState() => _InoovaMapasState();
}

class _InoovaMapasState extends State<InoovaMapas> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Mapas",
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              heightFactor: 2,
              child: Text(
                "Tela Inicial!",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                )
              ),
            ),
            Center(
              child: Image(
                image: AssetImage("assets/imagens/inoova.png")
              ),
            )
          ]
        ),
      ),
    );
  }
}
