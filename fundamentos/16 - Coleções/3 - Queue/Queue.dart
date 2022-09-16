import 'dart:collection';

///
/// * Queue é uma coleção ordenada entre chaves {} sem index, que manipula o início e o fim da lista.
///

queue() {
  print('13.3.0) Queue');
  Queue<int?> queue = Queue();
  print('Implementação ${queue.runtimeType}'); //ListQueue<int>
  queue.addAll([20, 30]);
  queue.add(40);
  print(queue);
  queue.addFirst(10);
  queue.addLast(50);
  print(queue);
  queue.add(60);
  print(queue);
  queue.removeLast();
  print(queue);
  queue.add(null);
  queue.forEach((e) => print(e));
}

main() {
  queue();
}
