import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
