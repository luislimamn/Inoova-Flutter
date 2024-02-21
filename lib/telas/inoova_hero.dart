import 'package:flutter/material.dart';
import 'package:inoova/telas/inoova_hero_detail.dart';

class InoovaHero extends StatelessWidget {
  const InoovaHero({super.key});

  final String _titulo = "Inoova Hero";
  final String _imagemLogo = "assets/imagens/inoova.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _titulo,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            textAlign: TextAlign.center,
            "Inoova Imagem em Detalhe",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        body: Column(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InoovaHeroDetail()),
                    );
                  },
                  child: Hero(
                    tag: "inoova",
                    child: Image(
                      image: AssetImage(_imagemLogo),
                      width: 200,
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: const Text("Imagem em Detalhe"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const InoovaHeroDetail()),
                    );
                  },
                ),
              ),
            ]
        ),
      ),
    );
  }
}
