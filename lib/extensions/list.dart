import 'dart:math';

extension RandomListItem<T> on List<T> {
  T pick() {
    return this[Random().nextInt(length)];
  }
}