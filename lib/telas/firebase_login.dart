import 'package:flutter/material.dart';
import 'package:inoova/telas/home_page.dart';

void main() => runApp(
    MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          //primaryColor: const Color(0xff795548),
          scaffoldBackgroundColor: Colors.white
      ),
    )
);

/*
void main() {
  runApp(const MyApp());
}
*/



//Banco de Dados
/*
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if
        request.time < timestamp.date(2024, 2, 28);
    }
  }
}

 */

/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {

  //Configuração do Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth auth = FirebaseAuth.instance;

  //Criando eMail e Senha
  String email = "jjnfreire@gmail.com";
  String password = "111111";

  // Metodo para Deslogar
  //auth.signOut();

  /*
  auth.createUserWithEmailAndPassword(
      email: email,
      password: password
  ).then((firebaseUser) {
    if (kDebugMode) {
      print("Novo Usuário: Erro ${firebaseUser.user?.email}");
    }
  }).catchError((erro){
    if (kDebugMode) {
      print("Novo Usuário: Erro ${erro.toString()}");
    }
  });
  */

  /*
  User? usuarioAtual = auth.currentUser;
  if( usuarioAtual != null ){ //logado
    if (kDebugMode) {
      print("Usuario atual logado email: ${usuarioAtual.email}" );
    }
  }else{ //deslogado
    if (kDebugMode) {
      print("Usuario atual está DESLOGADO!!");
    }
  }
  */

  /*
  auth.signInWithEmailAndPassword(
    email: email,
    password: password
  ).then((firebaseUser){
    if (kDebugMode) {
      print("Logar usuario: sucesso!! e-mail: ${firebaseUser.user?.email}" );
    }
  }).catchError((erro){
    if (kDebugMode) {
      print("Logar usuario: erro $erro" );
    }
  });
  */

  //Firestore
  //Firestore db = Firestore.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  /*
  //Salvando e Atualizando Tabela no Firestore com id manual
  db.collection("usuarios")
      .doc("002") //Era .document
      .set({ //Era .setData
    "nome": "Luis Lima",
    "idade": "38"
  });
  */

  /*
  //Salvando e Atualizando Tabela no Firestore com id automatico
  DocumentReference ref = await db.collection("noticias")
      .add({
        "titulo": "Android vai copiar o iOS",
        "descricao": "Android vai liberar converter Chip em eSIM."
      });
  if (kDebugMode) {
    print("Dados exibicao: ${ref.id}" );
  }
  */

  /*
  //Apagando 1 item pelo id automatico
  //alk9gTnNSJV3vsVtS04E
  db.collection("noticias").doc("alk9gTnNSJV3vsVtS04E").delete();
  */

  /*
  //Recuperando 1 item pelo id
  DocumentSnapshot snapshot = await db.collection("usuarios")
      .doc("001")
      .get();
  var dados = snapshot.data();
  if (kDebugMode) {
    print("Dados exibicao: $dados");
    //print("Dados exibicao, Nome: ${dados["nome"]} - Idade: ${dados["idade"]}");
  }
  */

  //Lendo Todos os Dados
  QuerySnapshot querySnapshot = await db
      .collection("usuarios")
      .get();
  if (kDebugMode) {
    print("Dados exibicao: ${querySnapshot.docs}" );
  }
  for( DocumentSnapshot item in querySnapshot.docs ){
    var dados = item.data();
    if (kDebugMode) {
      print("Dados exibicao: $dados");
      //print("Dados exibicao, Nome: ${dados["nome"]} - Idade: ${dados["idade"]}");
    }
  }

  /*
  //Lendo Todos os Dados e Sendo Avisado Caso Adicione um Novo
  db.collection("usuarios").snapshots().listen(
          ( snapshot ){
        for( DocumentSnapshot item in snapshot.docs ){
          var dados = item.data();
          if (kDebugMode) {
            print("Dados exibicao: $dados");
            //print("Dados exibicao, Nome: ${dados["nome"]} - Idade: ${dados["idade"]}");
          }
        }
      }
  );
  */

  /*
  //Aplicando filtros
  QuerySnapshot querySnapshot = await db.collection("usuarios")
      //.where("nome", isEqualTo: "Messi")
      //.where("idade", isEqualTo: "38")
      //.where("idade", isGreaterThan: 28)//< menor, > maior, >= maior ou igual, <= menor ou igual
      //.where("idade", isLessThan: 37)
      //.where("nome", isLessThan: "A")
      //.where("nome", isGreaterThan: "A")
      .where("nome", isGreaterThanOrEqualTo: "An")
      .where("nome", isLessThanOrEqualTo: "Fr" + "\uf8ff")
      //descendente (do maior para o menor) ascendente (do menor para o maior)
      //.orderBy("idade", descending: true )
      //.orderBy("nome", descending: false )
      //.limit(1) //Quantidade de Retornos
      .get();
  for( DocumentSnapshot item in querySnapshot.docs ){
    var dados = item.data();
    if (kDebugMode) {
      print("Dados exibicao: $dados");
      //print("Dados exibicao, Nome: ${dados["nome"]} - Idade: ${dados["idade"]}");
    }
  }
  */

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/
