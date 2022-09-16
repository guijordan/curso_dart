import 'package:projeto/projeto.dart' as projeto;

///  * Assert
///  - Usa lógica boleana para testar afirmações no modo debug!
///  - Try/Catch pode ser usado para tratar a exceção !
///
///  * Test
///  - Certifique-se de ter o package 'test' em 'dev_dependencies' no arquivo pubspec.yaml
///  - Atualize oo packages no terminal usando "pub get"
///  - Execute os testes na pasta raiz usando "pub run test"
/// - Podemos testar variaveis, funções e efetuar testes em grupos
///
/// Sintaxe
/// test("Descricao", (){
///  expect(valorReal, valorEsperado)
/// });
void main(List<String> arguments) {
  print('19.0.0) Testes Unitários\n');

  print('Hello world: ${projeto.calculate()}!');
  print('Listar Nomes: ${projeto.converterEmLista('Fernando Martins')}!');
  print('Verificar a maioridade: ${projeto.maioridade(-17)}!');
  print('Recuperar nome: ${projeto.recupearNome(['Fernando', 'Martins'])}!');
  print('Resto da divisão: ${projeto.restoDivisao(12, 3)}!');

  //fora do try catch gera exceção.
  String? texto;
  assert(texto == null);

  try {
    String telefone = '12345678';
    assert(telefone.length == 9, 'O telefone deve conter 9 dígitos.');
  } catch (e) {
    print('Excecao $e');
  }
}
