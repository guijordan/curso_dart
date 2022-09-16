/*
  * Métodos (override/sobreposição != overload/sobrecarga)
  - Override: Temos sobrescrita dos métodos da classe pai na classe herdeira

  * Construtores
  - Super se refere ao construtor da classe herdeira

  * Classe Abstrata
  - Não podem ser instanciadas servem como modelo
  - Métodos sem escopo devem ser sobrescritos nas classes herdeiras
*/

import 'Cao.dart';

void main() {
  print('13.0 ) Sobrescrita de Métodos Atributos e Construtores \n');

  var cao = Cao.domestico('Chloe', 'Pug', 'Fêmea');
  print('Nome: ${cao.nome} raca: ${cao.raca} sexo: ${cao.sexo} idade: ${cao.idade} docil: ${cao.docil}');
  print('desenvolvimento: ${cao.desenvolvimento} Tipo: ${cao.coluna ? 'Vertebrado' : 'Invertebrado'}');
  cao
    ..dormir()
    ..alimentar()
    ..reproduzir()
    ..acao();
  print(cao);
  print('${cao.nome} ${cao.docil ? 'Está amigável' : 'Não está amigavel'}');
}
