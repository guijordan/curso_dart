int calculate() {
  return 6 * 7;
}

List<String> converterEmLista(String nome) {
  return nome.split(' ').toList();
  //return nome.split(' ').map((e) => e.toUpperCase()).toList();
}

recupearNome(List<String> nomes) {
  return nomes[0];
}

double restoDivisao(double a, double b) {
  return a.remainder(b);
}

String maioridade(int idade) {
  try {
    if (idade < 0) throw ArgumentError('A idade não pode ser negativa!');
    return idade < 14
        ? 'Criança'
        : idade < 18
            ? 'Adolecente'
            : 'Adulto';
  } catch (e) {
    print('Excecao: $e');
    return 'null';
  }
}
