import 'package:flutter/material.dart';
import 'package:inoova/telas/inoova_mapas.dart';
import 'package:inoova/telas/inoova_musicas.dart';
import 'package:inoova/telas/inoova_notas.dart';
import 'package:inoova/telas/inoova_tarefas.dart';
import 'package:inoova/telas/inoova_videos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  final String _titulo = "Inoova App Bar";
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 5,
        vsync: this,
        initialIndex: 0
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.blue, //Cor de Fundo do Titulo
        foregroundColor: Colors.lightGreenAccent, //Cor do Texto do Titulo
        bottom: TabBar(
            labelColor: Colors.lightGreenAccent,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.lightGreenAccent,
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: "Inicio",
                icon: Icon(Icons.home),
              ),
              Tab(
                text: "Musicas",
                icon: Icon(Icons.library_music),
              ),
              Tab(
                text: "Videos",
                icon: Icon(Icons.video_library),
              ),
              Tab(
                text: "Tarefas",
                icon: Icon(Icons.check_box),
              ),
              Tab(
                text: "Notas",
                icon: Icon(Icons.list_alt),
              )
            ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          InoovaMapas(),
          InoovaMusicas(),
          InoovaVideos(),
          InoovaTarefas(),
          InoovaNotas()
        ],
      ),
    );
  }
}
