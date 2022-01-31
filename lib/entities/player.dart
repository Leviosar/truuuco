import 'package:truuco/entities/card.dart';
import 'package:truuco/extensions/list.dart';

class Player {
  String? name;
  List<Card> hand;
  int points;

  Player({required this.hand, this.name, this.points = 0});

  draw(Card card) {
    hand.add(card);
  }

  Future<Card> play() {
    return Future.value(hand.pick());
  }
}