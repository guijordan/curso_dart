/**
 *  * Conceito
 *    - Representational State Transfer (Transferência Representacional de Estado)
 *    - É uma arquitetura que define um conjunto de restrições na criação de web services.
 *    - É uma padronização para multiplas aplicações possam se comunicar usando protocolo HTTP.
 */

import 'dart:convert';

import '../../07 - Classes/Usuario.dart';

///
/// * SERIALIZAÇÃO MANUAL - Biblioteca JSON integrada ao dart 'dart:convert'
///
/// * Serialização JSON direta
///   - Perde recursos estatico de linguagens:
///   - Segurança de tipo, autocompletar e exceções de tempo de compilação.
///

conversaoDireta() {
  print('20.0.0) JSON Conversão Direta\n');

  String jsonData = '''
  {
    "nome":"Fernando",
    "idade":36,
    "email":"fm@gmail"
  }
''';

//DECODE
  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  print("parsedJson $parsedJson");
  String nome = parsedJson["nome"];
  int idade = parsedJson["idade"];
  String email = parsedJson["email"];
  print('USO DIRETO: nome: $nome idade: $idade email $email\n');

  //ENCODE
  Map<String, dynamic> map = {'nome': nome, 'idade': idade, 'email': email};
  String toJson = jsonEncode(map);
  print('ToJson: $toJson');
}

///
/// * Serialização JSON em Objeto
///   - Utiliza recursos estáticos de linguagens:
///   - Segurança de tipos, autocompletar e exceções de tempo de compilação.
///
conversaoObjeto() {
  print('20.0.1) JSON Conversão Objeto\n');
  String jsonData = '''
  [
    {
      "nome":"Fernando",
      "idade":36,
      "email":"fm@gmail"
    },
    {
      "nome":"Fernnando",
      "idade":36,
      "email":"fm@gmail"
    }
  ]
''';

//Decode
  List<dynamic> parsedJson = jsonDecode(jsonData);
  print('parsedJson: $parsedJson\n');
  ListaUsuarios listaUsuarios = ListaUsuarios.fromJson(parsedJson);
  Usuario usuario = listaUsuarios.usuarios.singleWhere((e) => e.nome == 'Fernando');
  print('USO: OBJETO: nome: ${usuario.nome} idade: ${listaUsuarios.usuarios.elementAt(0).idade} email: ${listaUsuarios.usuarios[0].email}\n');

  var usuarioNovo = Usuario.fromJson({'nome': 'Chloe', 'idade': 1, 'email': 'cm@gmail'});
  listaUsuarios.usuarios.addAll([usuarioNovo]);

  //Encode
  List<dynamic> lista = listaUsuarios.toJson();
  String toJson = json.encode(lista);
  String teste = json.encode(listaUsuarios);
  print('toJson: $toJson');
  print('teste $teste');
}

main() {
  conversaoDireta();
  conversaoObjeto();
}

class ListaUsuarios {
  List<Usuario> usuarios;

//? Construtor default da classe.
  ListaUsuarios({required this.usuarios});

//? Construtor com lista de incialização, usa this para passar os parametros para o construtor default
  ListaUsuarios.fromJson(List<dynamic> json) : this(usuarios: json.map((e) => Usuario.fromJson(e)).toList());

  List<dynamic> toJson() {
    return usuarios;
  }
}

class Usuario {
  late final String nome;
  late final int idade;
  late final String email;

//? Construtor default da classe.
  Usuario({required this.nome, required this.idade, required this.email});

//Constutor nomeado para criar uma nova instancia a partir de um map.
  // Usuario.fromJson(Map<String, dynamic> json) {
  //   this.nome = json['nome'];
  //   this.idade = json['idade'];
  //   this.email = json['email'];
  // }

//? Construtor Factory retorna uma nova instancia do construtor default da classe a partir de um map.
  // factory Usuario.fromJson(Map<String, dynamic> json) {
  //   return Usuario(
  //     nome: json['nome'],
  //     idade: json['idade'],
  //     email: json['email'],
  //   );
  // }

//? Construtor com lista de incialização, define parametros antes de executar o escopo do construtor.
  // Usuario.fromJson(Map<String, dynamic> json)
  //     : nome = json['nome'],
  //       idade = json['idade'],
  //       email = json['email'] {
  //   //Parametros Iniciais
  // }

//? Construtor com lista de incialização, usa this para passar os parametros para o construtor default
  Usuario.fromJson(Map<String, dynamic> json) : this(nome: json['nome'], idade: json['idade'], email: json['email']);

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'idade': idade,
      'email': email,
    };
  }
}
