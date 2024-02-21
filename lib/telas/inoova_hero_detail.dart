import 'package:flutter/material.dart';

class InoovaHeroDetail extends StatefulWidget {
  const InoovaHeroDetail({super.key});

  @override
  State<InoovaHeroDetail> createState() => _InoovaHeroDetailState();
}

class _InoovaHeroDetailState extends State<InoovaHeroDetail> {

  final String _titulo = "Inoova Hero";
  final String _imagemLogo = "assets/imagens/inoova.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _titulo,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_titulo),
          backgroundColor: Colors.blue, //Cor de Fundo do Titulo
          foregroundColor: Colors.lightGreenAccent, //Cor do Texto do Titulo
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
        ),
        body: Hero(
          tag: "inoova",
          child: Image(image: AssetImage(_imagemLogo)),
        ),
      ),
    );
  }
}
