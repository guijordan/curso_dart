import 'package:projeto/projeto.dart';
import 'package:test/test.dart';

void main() {
  //Testes variaveis
  test('Converter Strings em Array', () {
    String texto = 'Fernando,Leila,Chloe';
    expect(texto.split(','), equals(['Fernando', 'Leila', 'Chloe']));
  });
  //Testes em funções
  test('calculate', () {
    expect(calculate(), 42);
  });

  group('Manipulação de Strings', () {
    test('ConverterEmLista', () => expect(converterEmLista('Leila Martins'), equals(['Leila', 'Martins'])));
    test('Recuperar Nome', () => expect(recupearNome(['Fernando', 'Martins']), allOf(contains('nando'), isNot(startsWith('Lei')), endsWith('ndo'))));
  });

  group('Manipulação de ints', () {
    test('Resto da divisão', () => expect(restoDivisao(12, 3), equals(0)));

    test('Verificar Maioridade', () {
      expect(maioridade(18), 'Adulto');
      expect(maioridade(17), 'Adolecente');
      expect(maioridade(13), 'Criança');
      //expect(maioridade(-1), 'Criança');
    });
  });
}
