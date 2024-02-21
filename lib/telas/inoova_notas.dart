import 'package:flutter/material.dart';

/*
  import 'package:firebase_core/firebase_core.dart';
  import 'firebase_options.dart';

// ...

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );

   */


class InoovaNotas extends StatefulWidget {
  const InoovaNotas({super.key});

  @override
  State<InoovaNotas> createState() => _InoovaNotasState();
}

class _InoovaNotasState extends State<InoovaNotas> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Notas",
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Center(
              heightFactor: 2,
              child: Text(
                "Inoova Notas!",
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
