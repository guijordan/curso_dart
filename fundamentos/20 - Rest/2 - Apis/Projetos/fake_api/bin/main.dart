/*
  Dependencia HTTP: https://pub.dev/packages/http
  FAKE API: https://jsonplaceholder.typicode.com/
*/

import 'dart:convert';

import 'package:fake_api/models/Posts.dart';
import 'package:fake_api/models/Users.dart';
import 'package:http/http.dart' as http;

jsonGet() async {
  print('20.2.1) Get\n');
  String url = 'https://jsonplaceholder.typicode.com/users';
  try {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', '/users'));
    if (response.statusCode == 200) {
      print('STATUSCODE: ${response.statusCode}');
      //print('BODY: ${response.body}');

      //DECODE
      List<dynamic> parsedJson = jsonDecode(response.body);
      print('ParsedJson: $parsedJson\n');
      var obj = Users.fromJson(parsedJson);

      //USO OBJETO
      print('uso objeto: ${obj.users.map((e) => e.address?.geo?.lat).toList()}\n');

      //ENCODE
      List<dynamic> map = obj.toJson();
      String toJson = jsonEncode(map);
      print('toJson: $toJson');
    } else {
      throw Exception('Erro ao obter os dados: ${response.statusCode}');
    }
  } catch (e) {
    print('Exceção: $e');
  }
}

jsonPost() async {
  print('20.2.2) Post\n');
  String url = 'https://jsonplaceholder.typicode.com/posts';

  //Decode
  Map<String, dynamic> parsedJson = {
    'title': 'Postagem de Fernando',
    'body': 'Funcionou! Não sei como mas funcionou !',
    'userId': 1,
  };
  var obj = Posts.fromJson(parsedJson);

  //USO OBJETO
  print('uso objeto: ${obj.title}');

  //ENCODE
  String toJson = jsonEncode(obj);

  try {
    var response = await http.post(
      Uri.https('jsonplaceholder.typicode.com', '/posts'),
      body: toJson,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      print('\nSTATUSCODE: ${response.statusCode}\n');
      print('\nBODY: ${response.body}\n');
    } else {
      throw Exception('Erro ao efetuar POST: \nSTATUSCODE: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

jsonPut() async {
  print('20.2.3) Put\n');
  String url = 'https://jsonplaceholder.typicode.com/posts/1';

  //Decode
  Map<String, dynamic> parsedJson = {
    'id': 10,
    'title': 'Postagem de Fernando',
    'body': 'Funcionou! Não sei como mas funcionou !',
    'userId': 100,
  };
  var obj = Posts.fromJson(parsedJson);

  //USO OBJETO
  print('uso objeto: ${obj.title}');

  //ENCODE
  String toJson = jsonEncode(obj);

  try {
    var response = await http.put(
      Uri.https('jsonplaceholder.typicode.com', '/posts/1'),
      body: toJson,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('\nSTATUSCODE: ${response.statusCode}\n');
      print('\nBODY: ${response.body}\n');
    } else {
      throw Exception('Erro ao efetuar PUT: \nSTATUSCODE: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

jsonPatch() async {
  print('20.2.4) Patch\n');
  String url = 'https://jsonplaceholder.typicode.com/posts/1';

  //Decode
  Map<String, dynamic> parsedJson = {
    'id': 10,
    'title': 'Postagem de Fernando',
    'userId': 100,
  };
  var obj = Posts.fromJson(parsedJson);

  //USO OBJETO
  print('uso objeto: ${obj.title}');

  //ENCODE
  String toJson = jsonEncode(obj);

  try {
    var response = await http.patch(
      Uri.https('jsonplaceholder.typicode.com', '/posts/1'),
      body: toJson,
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print('\nSTATUSCODE: ${response.statusCode}\n');
      print('\nBODY: ${response.body}\n');
    } else {
      throw Exception('Erro ao efetuar PATCH: \nSTATUSCODE: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

jsonDelete() async {
  print('20.2.5) Delete\n');
  String url = 'https://jsonplaceholder.typicode.com/posts/1';

  try {
    var response = await http.delete(
      Uri.https('jsonplaceholder.typicode.com', '/posts/1'),
    );
    if (response.statusCode == 200) {
      print('\nSTATUSCODE: ${response.statusCode}\n');
      print('\nBODY: ${response.body}\n');
    } else {
      throw Exception('Erro ao efetuar DELETE: \nSTATUSCODE: ${response.statusCode}');
    }
  } catch (e) {
    print(e);
  }
}

main() {
  //jsonGet();
  //jsonPost();
  //jsonPut();
  //jsonPatch();
  jsonDelete();
}
