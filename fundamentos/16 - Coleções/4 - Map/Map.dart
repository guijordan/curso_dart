///
/// * Conceito
///  - Map é uma coleção dinâmica e customizável de chaves e valores entre {}. As chaves são únicas, e os valores não se repetem!
///

linkedHashMap() {
  print('16.4.0) LinkedHashMap == Map\n');
  List<String> nomes = ['Fernando', 'Leila'];
  Map<int, String> nomesMap = nomes.asMap();
  print('\n$nomesMap');
  nomesMap.forEach((chave, valor) => print('$chave: $valor'));

  Map<String?, dynamic> frutas = Map();
  frutas['banana'] = 'amarela';
  frutas['banana'] = 'verde'; //mesma chave atualiza o valor
  frutas['goiaba'] = 'amarela';
  frutas['maca'] = 'vermelho';
  print('\n$frutas');
  print(frutas.containsKey('banana'));
  print(frutas.containsValue('azul'));

  print(frutas['banana']);
  frutas.clear();
  frutas[null] = [null]; //Aceita chave e valor nulos.
  print('$frutas\n');

  Map<String, dynamic> usuario = Map.from({'nome': 'Fernando', 'idade': 36, 'peso': 65.5});
  usuario.update('nome', (valor) => '$valor Martins');
  usuario.update('idade', (valor) => ++valor);
  usuario.update('peso', (valor) => 70, ifAbsent: () => 'indefinido');
  print(usuario);
  usuario.removeWhere((chave, valor) => chave == 'peso' && valor == 70);
  print(usuario);
  usuario.update('peso', (valor) => 70, ifAbsent: () => 'indefinido');
  print(usuario);
  usuario.putIfAbsent('altura', () => 1.83);
  print(usuario);
  usuario.addAll({'sexo': 'masculino', 'casado': true});
  print(usuario);
  print('chaves: ${usuario.keys} \n${usuario.values}');

  Map<int, dynamic> numeros = {0: 'Zero', 1: 'Um', 2: 'Dois'};
  print(numeros);
  print(numeros.map((chave, valor) => MapEntry(chave, '${valor.toUpperCase()}'))); //Mapeando valores
  for (var chave in numeros.keys) {
    print('forIn: $chave');
  }

  for (var valor in numeros.values) {
    print('forIn: $valor');
  }

  for (var key in numeros.keys) {
    final valor = numeros[key];
    print('forIn: $key valor $valor');
  }
}

///
/// * Map
///  - Map trnasforma/seleciona os elementos de uma coleção criando uma nova do memo tamanho!
///
mapMap() {
  print('\n16.4.1) Map map\n');

  List<Map<String, dynamic>> carrinho = [
    {'nome': 'Borracha', 'preco': 3.45},
    {'nome': 'Caderno', 'preco': 13.9},
    {'nome': 'KitLapis', 'preco': 41.22},
    {'nome': 'Caneta', 'preco': 7.5},
  ];
  Function(Map<String, dynamic>) porcentagem(desconto) => (Map<String, dynamic> valor) => desconto * valor['preco'];
  final moeda = (e) => 'RS ${e.toDouble().toStringAsFixed(2).replaceFirst('.', ',')}';
  List<String> precos1 = carrinho.map(porcentagem(0.9)).map(moeda).toList();
  List<String> precos2 = carrinho.map((e) => e.update('preco', (e) => e * .9)).map(moeda).toList();

  String precoMedio = (carrinho.map((e) => e['preco']).toList().reduce((p, c) => p + c) / carrinho.length).toStringAsFixed(2);
  print('Lista Preco1: $precos1 \nLista Preco2: $precos2 \nPreco Media: ${precoMedio}');

  List<Map<String, Object>> escola = [
    {
      'nome': 'Turma T1',
      'alunos': [
        {'nome': 'Fernando', 'nota': 8.1},
        {'nome': 'Leila', 'nota': 9.3},
      ]
    },
    {
      'nome': 'Turma T2',
      'alunos': [
        {'nome': 'Chloe', 'nota': 8.9},
        {'nome': 'Bartolomeu', 'nota': 7.3},
      ]
    }
  ];

  //List<dynamic> alunosEscola = escola.map((e) => e['alunos'] as List<Map<String, dynamic>>).expand((a) => a).map((e) => e['nota']).toList();
  List<dynamic> alunosEscola = escola.map((e) => e['alunos'] as List<Map<String, dynamic>>).expand((a) => a).toList();
  print('Lista Ordenada: $alunosEscola');
  alunosEscola.sort((b, a) => a['nota'].compareTo(b['nota']));
  print('Lista Ordenada: $alunosEscola');
  double mediaNotas = alunosEscola.map((e) => e['nota']).reduce((p, c) => p + c) / alunosEscola.length;
  print('Media Alunos: $mediaNotas');
  alunosEscola.forEach((e) => print('${e['nome']} ${e['nota']}'));
}

///
/// * Conceito
///  - Every faz o teste em 'todos' elementos com o operador lógico && retornando (true ou false)
everyMap() {
  print('\n16.4.2) Map Every \n');
  List<Map<String, dynamic>> pessoas = [
    {'nome': 'Lúcio', 'idade': 60},
    {'nome': 'Leila', 'idade': 31},
    {'nome': 'Leandro', 'idade': 17},
  ];
  print(pessoas.every((e) => e.containsKey('nome')));
  print(pessoas.every((element) => element['idade'] >= 17));
  bool maiores = pessoas.every((element) => element['nome'].startsWith('L'));
  print(maiores);
}

///
/// * Conceito
///  - Where filtra os elementos da coleção criando uma nova do mesmo tamanho ou menor
///

whereMap() {
  print('\n16.4.3) Map Where \n');

  List<Map<dynamic, dynamic>> produtos = [
    {'nome': 'Notebook', 'preco': 2499, 'fragil': true},
    {'nome': 'iPad', 'preco': 4199, 'fragil': true},
    {'nome': 'iPhone', 'preco': 2299, 'fragil': true},
    {'nome': 'Magic Mouse', 'preco': 299, 'fragil': false}
  ];
  final fragil = (e) => e['fragil'] == true;
  final nome = (e) => e['nome'];
  List<dynamic> resultado = produtos.where(fragil).map(nome).toList();
  print('Produtos Frageis: $resultado \n');

  List<Map<String, dynamic>> pessoas = [
    {'nome': 'Fernando', 'idade': 36},
    {'nome': 'Leila', 'idade': 31},
    {'nome': 'Leandro', 'idade': 17},
  ];

  List<Map<String, dynamic>> maiores = pessoas.where((e) => e['idade'] >= 21).toList();
  print('Maiores: $maiores');

  Map<String, dynamic> comecaComL = pessoas.firstWhere((e) => e['nome'].startsWith('L'), orElse: () => {});
  Map<String, dynamic> menores = pessoas.singleWhere((element) => element['idade'] < 18);
  final Function(Map<String, dynamic>) idades = (e) => e['idade'];
  final Function(dynamic, dynamic) soma = (p, c) => p + c;
  var media = (pessoas.map(idades).reduce(soma)) / pessoas.length;
  print('Maiores: $maiores \nMenores: $menores \nComeça com L : $comecaComL \nMedia Idades:$media');
}

///
/// * Conceito:
///   - Reduce compara os elementos da coleção retornando 1 único elemento resultante!
///   - Ao interagir com os elementos o indice 0 se torna o anterior, 1 se torna o atual.
reduceMap() {
  print('16.4.4) Map Reduce \n');
  List<Map<String, dynamic>> alunos = [
    {'nome': 'Fernando', 'nota': 7.3, 'bolsista': false},
    {'nome': 'Leila', 'nota': 9.2, 'bolsista': true},
    {'nome': 'Chloe', 'nota': 9.8, 'bolsista': true},
    {'nome': 'Bartolomeu', 'nota': 8.7, 'bolsista': false},
  ];

  final bool Function(Map<String, dynamic>) bolsistas = (e) => e['bolsista'];
  final Function(Map<String, dynamic>) nomes = (e) => e['nome'];
  final Function(Map<String, dynamic>) notas = (e) => e['nota'];
  final Function(dynamic, dynamic) soma = (p, c) => p + c;
  List<dynamic> bolsistasNomes = alunos.where(bolsistas).map(nomes).toList();
  List<Map<String, dynamic>> medias = alunos.where(bolsistas).toList();
  var bolsistasMedia = medias.map(notas).reduce(soma) / medias.length;
  bool todosBolsistas = alunos.map(bolsistas).reduce((p, c) => p && c);
  bool algumBolsista = alunos.map(bolsistas).reduce((p, c) => p || c);
  print('Todos são Bolsistas ? ${todosBolsistas ? 'Sim' : 'Não'}\nAlgum Bolsista ? ${algumBolsista ? 'Sim' : 'Não'}');
  print('Alunos Bolsistas: $bolsistasNomes Medias notas: $bolsistasMedia');

  List<dynamic> funcionarios = [
    {'nome': 'Leila', 'genero': 'M', 'pais': 'Brasil', 'salario': 1599.70},
    {'nome': 'Fernando', 'genero': 'M', 'pais': 'Argentino', 'salario': 1234.36},
    {'nome': 'Chloe', 'genero': 'M', 'pais': 'Brasil', 'salario': 1730.30},
  ];

  final bool Function(dynamic) brasileiros = (e) => e['pais'] == 'Brasil';
  final bool Function(dynamic) mulheres = (e) => e['genero'] == 'M';
  final Function(dynamic, dynamic) menorSalario = (p, c) => p['salario'] < c['salario'] ? p['salario'] : c['salario']; // Filtro para salarios
  final Function(dynamic, dynamic) funcMenorSalario = (p, c) => p['salario'] < c['salario'] ? p : c; // Filtro para funcionarios
  List<dynamic> selecionados = funcionarios.where(brasileiros).where(mulheres).toList();
  print(selecionados);
  print(selecionados.reduce(menorSalario));
  Map<String, dynamic> funcionario = selecionados.reduce(funcMenorSalario);
  print('Funcionario: ${funcionario['nome']} Salario: ${funcionario['salario']}');
}

main() {
  linkedHashMap();
  mapMap();
  everyMap();
  whereMap();
  reduceMap();
}
