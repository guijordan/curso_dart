/*
  * Conceito
  - Intefaces são modelos para implementar métodos e atributos em nossas classes

  * Regras
  - Ao implementar uma interface devemos utilizar todos os métodos e atributos
  - No dart não tem sintaxe para interfaces, pode ser uma classe concreta ou abstrata!
  - Pode implementar mais de uma interfaces e deve sobrescrever todos os métodos e atributos!
*/

import 'Candidato.dart';

void main() {
  print('15.0 ) Interfaces \n');
  var bolsonaro = Candidato('Bolsonaro', ideologia: 'Direito', partido: 'PSL');
  bolsonaro
    ..objetivo = 'Ganhar Eleição'
    ..objetivosPessoais()
    ..postagem = 'Vou acabar com a corrupção no Brasil!'
    ..escreverPostagem();
}
