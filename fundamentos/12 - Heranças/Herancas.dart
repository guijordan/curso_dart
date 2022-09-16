/*
  * Regras
  - Uma classe só pode ter uma herança!

  * Construtores
  - Devem obedecer a ordem dos parametros
  - Parametros default devem ser nomeados ou posicionados,
  - Tratamento e tipagem de parametros deve ser feito na classe herdeira
*/

import 'Cao.dart';

void main() {
  print('12.0) Heranças de métodos, atributos e construtores');
  var cao = new Cao('Chloe', 'Pug', 'Fêmea');
  print('nome: ${cao.nome} raca: ${cao.raca} sexo: ${cao.sexo} idade: ${cao.idade} docil: ${cao.docil}');

  cao
    ..dormir()
    ..alimentar()
    ..acao();
  print('${cao.nome} ${cao.docil ? 'Está amigável' : 'não está amigável'}');
}
