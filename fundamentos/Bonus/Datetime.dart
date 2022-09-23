/*
  * Conceito: 
   - DateTime classe com construtores para definir segundos, hora, dias e anos.
   - Duration classe usada para definir um determinado tempo.
*/

String tempoAgora() {
  DateTime tempo = DateTime.now();
  String hora = '${tempo.hour}:${tempo.minute}:${tempo.second}:${tempo.microsecond}';
  return hora;
}

main() {
  print('1) DateTime\n');
  print('Compilando as ${tempoAgora()}');
  var p1 = Pessoa('Fernando', 1, 7, 1983, horas: 23, minutos: 55);
}

class Pessoa {
  String nome;
  late DateTime _data, _nascimento, _agora = DateTime.now();

  Pessoa(this.nome, int diaNasc, int mesNasc, int anoNasc, {int horas = 0, int minutos = 0}) {
    this._nascimento = DateTime.utc(anoNasc, mesNasc, diaNasc, horas, minutos);
    print('$nome nascido em $diaNasc/$mesNasc/$anoNasc ${diaSemana(_nascimento.weekday)} as $horas:$minutos ano ${bissexto(anoNasc)}'); //todo dia da semana, horas minutos e ano bissexto.
    fecundacao();
    tempo();
  }

  fecundacao() {
    int gestacaoMedia = 268;
    _data = _nascimento.subtract(Duration(days: gestacaoMedia));
    print('Data estimada da fecundação: ${_data.day}/${_data.month}/${_data.year} ${diaSemana(_nascimento.weekday)}');
  }

  tempo() {
    print('''Tem ${idade().toStringAsFixed(0)} anos e está vivo a :
    ${_agora.difference(_nascimento).inDays} horas
    ${_agora.difference(_nascimento).inHours} horas
    ${_agora.difference(_nascimento).inMinutes} minutos
    ${_agora.difference(_nascimento).inSeconds} segundos
    ''');
  }

  String bissexto(int ano) => (ano % 4 == 0 || ano % 400 == 0 && ano % 100 != 0) ? 'é bissexto' : 'não é bissexto';

  double idade() => _agora.difference(_nascimento).inDays / 360;

  String diaSemana(int dia) {
    switch (dia) {
      case 1:
        return 'segunda-feira';
      case 2:
        return 'terça-feira';
      case 3:
        return 'quarta-feira';
      case 4:
        return 'quinta-feira';
      case 5:
        return 'sexta-feira';
      case 6:
        return 'Sábado';
      case 7:
        return 'Domingo';
      default:
        return '';
    }
  }
}
