import 'dart:collection';

///
///Set é uma coleção de elementos únicos e ordenados entre chaves {}. Não tem acesso a indice!
///

linkedHashSet() {
  print('16.2.0) LinkedHashSet == Set \n');
  Set<int?> setInt = Set();
  print('Implementação: ${setInt.runtimeType}');
  //setInt[0] = 0;// não tem acesso a indice.
  setInt.add(13);
  setInt.add(13);
  setInt.add(null);
  setInt.add(17);
  setInt.add(17);
  setInt.remove(13);
  print(setInt); // representada por chaves.

  for (var i = 0; i < setInt.length; i++) {
    //print(setInt[i]); //não tem acesso a indice mas pode usar elementAt
    print('for: ${setInt.elementAt(i)}');
  }

  for (var elemento in setInt) {
    print('for in ${elemento}');
  }

  setInt.forEach((e) => print('forEach $e'));

  Set<int> listaA = {0, 1, 2, 3, 4};
  Set<int> listaB = {3, 4, 5, 6, 7};

  print(listaA.difference(listaB));
  print(listaA.union(listaB));
  print(listaA.intersection(listaB));
  print(listaA.lookup(5));
}

///
/// * HashSet é uma coleção de elementos únicos e desordenados.
///
hashSet() {
  print('\n16.2.1) Hashset\n');

  HashSet<String?> hashSet1 = HashSet();
  HashSet<int> hashSet2 = HashSet();
  HashSet<int> hashSet3 = HashSet();

  print('Implementação ${hashSet1.runtimeType}'); //_HashSet<String>
  hashSet1.add('A');
  hashSet1.add('B');
  hashSet1.add('C');
  hashSet1.add('D');
  hashSet1.add(null);

  hashSet2.add(1); //Apenas int com 1 decimal fica ordenada!
  hashSet2.add(2);
  hashSet2.add(3);

  hashSet3.add(11);
  hashSet3.add(22);
  hashSet3.add(33);

  print('$hashSet1 \n$hashSet2 \n$hashSet3');

  for (var i = 0; i < hashSet1.length; i++) {
    //print(setInt[i]); //não tem acesso a indice mas pode usar elementAt
    print('for hashSet1: ${hashSet1.elementAt(i)}');
  }

  for (var elemento in hashSet2) {
    print('for in hashSet2 ${elemento}');
  }

  hashSet3.forEach((e) => print('forEach hashSet3 $e'));
}

///
/// * SplayTreeSet organiza automaticamente os elementos em ordem crescente
/// * Por ser uma arvore de comparações não pode conter elementos null
///
splayTreeSet() {
  print('\n16.2.3) SplayTreeSet\n');
  SplayTreeSet<String?> splayTreeSet = SplayTreeSet();
  print('Implementacao: ${splayTreeSet.runtimeType}'); //SplayTreeSet<String>
  splayTreeSet.add('info1');
  splayTreeSet.add('info3');
  splayTreeSet.add('info');
  splayTreeSet.add('info2');
  //splayTreeSet.add(null);//Não pode conter null
  print(splayTreeSet);

  for (var i = 0; i < splayTreeSet.length; i++) {
    //print(setInt[i]); //não tem acesso a indice mas pode usar elementAt
    print('for splayTreeSet: ${splayTreeSet.elementAt(i)}');
  }

  for (var elemento in splayTreeSet) {
    print('for in splayTreeSet ${elemento}');
  }

  splayTreeSet.forEach((e) => print('forEach splayTreeSet $e'));
}

main() {
  linkedHashSet();
  hashSet();
  splayTreeSet();
}
