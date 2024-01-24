import 'package:flutter/material.dart';

class InoovaTarefas extends StatefulWidget {
  const InoovaTarefas({super.key});

  @override
  State<InoovaTarefas> createState() => _InoovaTarefasState();
}

class _InoovaTarefasState extends State<InoovaTarefas> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Tarefas",
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              heightFactor: 2,
              child: Text(
                "Inoova Tarefas!",
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
