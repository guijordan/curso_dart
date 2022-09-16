/*
*Static
  A variavel estatica fica disponível na propria classe em vez de suas instâncias/objetos
  Em métodos estáticos deve usar variaveis estáticas da classe. 
  Variaveis estáticas podem ser acessadas sem precisar instanciar classes/Objetos.
*/

import 'Calculos.dart';

void main() {
  print('10.0) Modificadores Static \n');
  double raio = 5;
  var calculos1 = new Calculos();
  print(calculos1.pi);
  print(calculos1.areaDoCirculo(raio));

  print('');
  Calculos calculos2 = Calculos();
  print(calculos2.pi);
  print(calculos2.areaDoCirculo(raio));

  print('\nInstâncias consomem ${identical(calculos1, calculos2) ? 'MENOS' : 'MAIS'} Memória\n');

  print(Calculos.piEstatico);
  print(Calculos.piEstatico * (raio * raio));

  print('Retornos Iguais: ${Calculos.areaDoCirculoEstatico(raio) == Calculos().areaDoCirculo(raio) ? 'SIM' : 'NAO'} Métodos Diferentes');
}
