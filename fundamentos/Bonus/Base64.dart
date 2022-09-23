import 'dart:convert';
import 'dart:typed_data';

/**
 * * Conceito:
 *  utf8:
 *    - Binário que representa qualquer caractere universal.
 *  Base64
 *    - Codificação de dados para transferência na internet
 *    - https://www.base64encode.org/
 */

main() {
  print('4 Base64 e utf8');
  String email = 'fma@gmail';

  //ENCODE
  List<int> ebytes = utf8.encode(email);
  String codificado = base64.encode(ebytes);
  print(codificado);

  //DECODE
  List<int> dbytes = base64.decode(codificado);
  String decodificado = utf8.decode(dbytes);
  print(decodificado);
}
