import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class InoovaMusicas extends StatefulWidget {
  const InoovaMusicas({super.key});

  @override
  State<InoovaMusicas> createState() => _InoovaMusicasState();
}

class _InoovaMusicasState extends State<InoovaMusicas> {

  AudioPlayer audioPlayer = AudioPlayer();
  bool primeiraExecucao = true;
  double _volume = 0.5;

  _executar() async {
    audioPlayer.setVolume(_volume);
    if(primeiraExecucao){
      await audioPlayer.play(AssetSource("audios/tutemumacara.mp3"));
      //await audioPlayer.play(UrlSource("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"));
      primeiraExecucao = false;
    }else{
      await audioPlayer.resume();
    }
  }

  _pausar() async {
    await audioPlayer.pause();
  }

  _parar() async {
    await audioPlayer.stop();
    primeiraExecucao = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inoova Music"),),
      body: Column(
        children: <Widget>[
          Slider(
              value: _volume,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              onChanged: (novoVolume){
                setState(() {
                  _volume = novoVolume;
                });
                audioPlayer.setVolume(_volume);
              }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/executar.png"),
                  onTap: (){
                    _executar();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/pausar.png"),
                  onTap: (){
                    _pausar();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  child: Image.asset("assets/imagens/parar.png"),
                  onTap: (){
                    _parar();
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
