import 'dart:convert';

main() {
  var jsonData = '''{
    "nome" : "Fernando", 
    "idade": 36, 
    "parentes": {
      "mae": "Marlene",
      "pai": "Delcio"
    },
    "tarefas": [
      "Pagar contas",
      "Estudar"
    ],
    "conjuge": {
      "nome" : "Leila", 
      "idade": 31,
      "parentes": {
        "mae": "Lindraci",
        "pai": "Pedro"
      }
    },
    "filhos" : [      
      {
        "nome" : "Chloe", 
        "idade": 1, 
        "vacinas": [
          "ACWY",
          "Sarampo"
        ]
      },
      {
        "nome" : "Bartolomeu", 
        "idade": 5, 
        "vacinas": [
          "ACWY",
          "Sarampo",
          "Meningite"
        ]
      }
    ],
    "bens": {
      "veiculos": [
        {
          "marca": "Maverick",
          "modelo": "Ford",
          "caracteristicas": {
            "tipo": "passeio",
            "passageiros": 5
          },
          "multas": [
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descricao": "Estacionar Local Proibido",
              "tipo": "Grave",
              "pontos": 4
            }
          ]
        },
        {
          "marca": "Kawasaki",
          "modelo": "Ninja H2R",
          "caracteristicas": {
            "tipo": "corrida",
            "passageiros": 2
          },
          "multas": [
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            },
            {
              "descricao": "Excesso Velocidade",
              "tipo": "Gravissima",
              "pontos": 7
            }
          ]
        }
      ],
      "imoveis": [
        {
          "tipo": "casa",
          "endereco": "Rua dos tolos, 0, Vila do Chaves",
          "contas": [
            {
              "tipo": "IPTU",
              "valor": 1000
            },
            {
              "tipo": "Condominio",
              "valor": 500
            }
          ]
        }
      ]
    }
  }''';

  //1 - identifique e crie as classes de acordo com o json
  //2 - Crie os construtores do mais profundo até a raiz
  //3 - faça o tratamento de erros.

  Map<String, dynamic> parsedJson = jsonDecode(jsonData);
  Pessoa pessoa = Pessoa.fromJson(parsedJson);
  print('DECODE: $parsedJson\n');
  print('USO DIRETO: ${parsedJson['bens']['veiculos'][0]['multas'][0]['descricao']}\n');
  print('USO OBJETO: ${pessoa.bens.veiculos.map((e) => e.multas.map((e) => e.descricao).toSet()).toList()}');

  Map<String, dynamic> map = pessoa.toJson();
  String toJson = jsonEncode(map);
  print('ENCODE: $toJson');
}

class Pessoa {
  String nome;
  int idade;
  Parentes parentes;
  List<String> tarefas;
  Conjuge conjuge;
  List<Filho> filhos;
  Bens bens;
  Pessoa({required this.nome, required this.idade, required this.parentes, required this.tarefas, required this.conjuge, required this.filhos, required this.bens});
  factory Pessoa.fromJson(Map<String, dynamic> json) {
    // List<dynamic> lista = json['filhos'];
    // List<Filho> dataLista = lista.map((e) => Filho.fromJson(e)).toList();
    return Pessoa(
      nome: json['nome'],
      idade: json['idade'],
      parentes: Parentes.fromJson(json['parentes']),
      tarefas: List<String>.from(json['tarefas']), //json['tarefas'].cast<String>()
      conjuge: Conjuge.fromJson(json['conjuge']),
      filhos: (json['filhos'] as List<dynamic>).map((e) => Filho.fromJson(e)).toList(),
      bens: Bens.fromJson(json['bens']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'nome': this.nome,
      'idade': this.idade,
      'parentes': this.parentes,
      'tarefas': this.tarefas,
      'conjuge': this.conjuge,
      'filhos': this.filhos,
      'bens': this.bens,
    };
  }
}

class Parentes {
  String mae;
  String pai;

  Parentes({required this.mae, required this.pai});

  Parentes.fromJson(Map<String, dynamic> json) : this(mae: json['mae'], pai: json['pai']);
  Map<String, dynamic> toJson() {
    return {'mae': this.mae, 'pai': this.pai};
  }
}

class Conjuge {
  String nome;
  int idade;
  Parentes parentes;

  Conjuge({required this.nome, required this.idade, required this.parentes});

  Conjuge.fromJson(Map<String, dynamic> json) : this(nome: json['nome'], idade: json['idade'], parentes: Parentes.fromJson(json['parentes']));
  Map<String, dynamic> toJson() {
    return {'nome': this.nome, 'idade': this.idade, 'parentes': this.parentes};
  }
}

class Filho {
  String nome;
  int idade;
  List<String> vacinas;
  Filho({required this.nome, required this.idade, required this.vacinas});

  Filho.fromJson(Map<String, dynamic> json)
      : this(
          nome: json['nome'],
          idade: json['idade'],
          vacinas: json['vacinas'].cast<String>(), //List<String>.from(json['vacinas'])
        );
  Map<String, dynamic> toJson() {
    return {
      'nome': this.nome,
      'idade': this.idade,
      'vacinas': this.vacinas,
    };
  }
}

class Bens {
  List<Veiculo> veiculos;
  List<Imovel> imoveis;
  Bens({required this.veiculos, required this.imoveis});

  Bens.fromJson(Map<String, dynamic> json)
      : this(
          veiculos: (json['veiculos'] as List).map((e) => Veiculo.fromJson(e)).toList(),
          imoveis: (json['imoveis'] as List).map((e) => Imovel.fromJson(e)).toList(),
        );
  Map<String, dynamic> toJson() {
    return {
      'veiculos': this.veiculos,
      'imoveis': this.imoveis,
    };
  }
}

class Veiculo {
  String marca;
  String modelo;
  Caracteristicas caracteristicas;
  List<Multa> multas;

  Veiculo({required this.marca, required this.modelo, required this.caracteristicas, required this.multas});

  Veiculo.fromJson(Map<String, dynamic> json)
      : this(
          marca: json['marca'],
          modelo: json['modelo'],
          caracteristicas: Caracteristicas.fromJson(json['caracteristicas']),
          multas: (json['multas'] as List).map((e) => Multa.fromJson(e)).toList(),
        );
  Map<String, dynamic> toJson() {
    return {
      'marca': this.marca,
      'modelo': this.modelo,
      'caracteristicas': this.caracteristicas,
      'multas': this.multas,
    };
  }
}

class Caracteristicas {
  String tipo;
  int passageiros;

  Caracteristicas({required this.tipo, required this.passageiros});

  Caracteristicas.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          passageiros: json['passageiros'],
        );
  Map<String, dynamic> toJson() {
    return {
      'tipo': this.tipo,
      'passageiros': this.passageiros,
    };
  }
}

class Multa {
  String descricao;
  String tipo;
  int pontos;
  Multa({required this.descricao, required this.tipo, required this.pontos});

  Multa.fromJson(Map<String, dynamic> json)
      : this(
          descricao: json['descricao'],
          tipo: json['tipo'],
          pontos: json['pontos'],
        );
  Map<String, dynamic> toJson() {
    return {
      'descricao': this.descricao,
      'tipo': this.tipo,
      'pontos': this.pontos,
    };
  }
}

class Imovel {
  String tipo;
  String endereco;
  List<Conta> contas;
  Imovel({required this.tipo, required this.endereco, required this.contas});

  Imovel.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          endereco: json['endereco'],
          contas: (json['contas'] as List).map((e) => Conta.fromJson(e)).toList(),
        );
  Map<String, dynamic> toJson() {
    return {
      'tipo': this.tipo,
      'endereco': this.endereco,
      'contas': this.contas,
    };
  }
}

class Conta {
  String tipo;
  int valor;
  Conta({required this.tipo, required this.valor});

  Conta.fromJson(Map<String, dynamic> json)
      : this(
          tipo: json['tipo'],
          valor: json['valor'],
        );
  Map<String, dynamic> toJson() {
    return {
      'tipo': this.tipo,
      'valor': this.valor,
    };
  }
}
