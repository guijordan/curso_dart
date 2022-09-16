/*
  * Final
    Inicializada apenas quando acessada em tempo de execução, deve ser declarada !
    Em coleções final nem todo conteúdo será final
*/

import 'Pessoa.dart';

void main() {
  print('10.1) Modificadores Final\n');
  //? Objeto em queda livre leva 5s para chegar ao solo ! Qual a velocidade máxima do objeto ?
  final gravidade = 9.8;
  int tempo = 5;
  double velocidade = gravidade * tempo;
  print('Velocidade máxima: $velocidade m/s \n');

  for (int i = 1; i <= 3; i++) {
    final indice = i;
    print('contagem $indice');
  }

  var pessoa = Pessoa('Fernando', ['Leila, Chloe']);
  pessoa.nome = 'Fernando Martins';
  //pessoa.familiares = []; //erro atributo final.
  print('Nome: ${pessoa.nome} familiares: ${pessoa.familiares}');
}
