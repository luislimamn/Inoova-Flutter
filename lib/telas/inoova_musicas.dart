import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InoovaMusicas extends StatefulWidget {
  const InoovaMusicas({super.key});

  @override
  State<InoovaMusicas> createState() => _InoovaMusicasState();
}

class _InoovaMusicasState extends State<InoovaMusicas> {

  AudioPlayer audioPlayer = AudioPlayer();
  bool primeiraExecucao = true;
  bool _estaTocando = false;
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
    setState(() {
      _estaTocando = true;
    });
  }

  _pausar() async {
    await audioPlayer.pause();
    setState(() {
      _estaTocando = false;
    });
  }

  _parar() async {
    await audioPlayer.stop();
    primeiraExecucao = true;
    setState(() {
      _estaTocando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Music",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            textAlign: TextAlign.center,
            "Inoova Music",
            style: TextStyle(
              color: Colors.lightGreenAccent,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Slider(
              activeColor: Colors.lightGreenAccent,
              secondaryActiveColor: Colors.blue,
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
                  padding: const EdgeInsets.all(7),
                  child: IconButton(
                    iconSize: 70,
                    onPressed: _parar,
                    icon: const Icon(
                      PhosphorIconsRegular.rewind,//rewind, fast-forward, skip-back, skip-forward
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                ),
                _estaTocando == false
                  ?
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: IconButton(
                      iconSize: 70,
                      onPressed: _executar,
                      icon: const Icon(
                        PhosphorIconsRegular.play,
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                  )
                  :
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: IconButton(
                      iconSize: 70,
                      onPressed: _pausar,
                      icon: const Icon(
                        PhosphorIconsRegular.pause,
                        color: Colors.lightGreenAccent,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: IconButton(
                    iconSize: 70,
                    onPressed: _parar,
                    icon: const Icon(
                      PhosphorIconsRegular.stop,
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: IconButton(
                    iconSize: 70,
                    onPressed: _parar,
                    icon: const Icon(
                      PhosphorIconsRegular.fastForward,//rewind, fast-forward, skip-back, skip-forward
                      color: Colors.lightGreenAccent,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
