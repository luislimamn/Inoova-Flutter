import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class InoovaMapas extends StatefulWidget {
  const InoovaMapas({super.key});

  @override
  State<InoovaMapas> createState() => _InoovaMapasState();
}

class _InoovaMapasState extends State<InoovaMapas> {

  File? _imagem;
  String _statusUpload = "Upload não Iniciado";
  String? _urlImagemRecuperada;

  Future _recuperarImagem(bool daCamera) async {

    ImagePicker picker = ImagePicker();
    if(daCamera){ // Da Camera
      setState(() async {
        _imagem = (await picker.pickImage(source: ImageSource.camera)) as File?;
      });
    }else{ // Da Galeria
      setState(() async {
        _imagem = (await picker.pickImage(source: ImageSource.gallery)) as File?;
      });
    }
  }

  Future _uploadImagem() async {
    //Referencia Arquivo
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference pastaRaiz = storage.ref();
    Reference arquivo = pastaRaiz
        .child("fotos")
        .child("foto1.jpg");

    //Fazendo Upload da Imagem
    UploadTask task = arquivo.putFile(_imagem as File);

    //Controlando progresso do Upload
    task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      if(taskSnapshot.state == TaskState.running){
        setState(() {
          _statusUpload = "Em Progresso";
        });
      }else if(taskSnapshot.state == TaskState.success){
        _recuperarUrlImagem(taskSnapshot);
        setState(() {
          _statusUpload = "Upload Realizado com Sucesso!";
        });
      }
    });

  }

  Future _recuperarUrlImagem(TaskSnapshot taskSnapshot) async {
    //Firebase Modelo Antigo
    //String url = await snapshot.ref.getDownloadURL();
    String url = await taskSnapshot.ref.getDownloadURL();
    if (kDebugMode) {
      print("Resultado Url: $url");
    }
    setState(() {
      _urlImagemRecuperada = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Inoova Salvar Imagens na Nuvem",
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Text(_statusUpload),
                ElevatedButton(
                  onPressed: (){
                    _recuperarImagem(true);
                  },
                  child: const Text("Camera"),
                ),
                ElevatedButton(
                  onPressed: (){
                    _recuperarImagem(false);
                  },
                  child: const Text("Galeria"),
                ),
                ElevatedButton(
                  onPressed: (){
                    _uploadImagem();
                  },
                  child: const Text("Salvar Arquivo"),
                ),
                _imagem == null
                    ? Container()
                    : Image.file(_imagem!),
                _imagem == null
                    ? Container()
                    : ElevatedButton(
                  child: const Text("Upload Storage"),
                  onPressed: (){
                    _uploadImagem();
                  },
                ),
                _urlImagemRecuperada == null
                    ? Container()
                    : Image.network(_urlImagemRecuperada!)
              ],
          ),
        ),
      ),
    );
  }
}
