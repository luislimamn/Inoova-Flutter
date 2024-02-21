import 'package:flutter/material.dart';

class InoovaSliverAppbar extends StatefulWidget {
  const InoovaSliverAppbar({super.key});

  @override
  State<InoovaSliverAppbar> createState() => _InoovaSliverAppbarState();
}

class _InoovaSliverAppbarState extends State<InoovaSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Stepper",
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    "JOÃO",
                    style: TextStyle(
                      fontSize: 600
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
