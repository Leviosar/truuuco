import 'package:truuco/entities/card.dart';
import 'package:truuco/entities/suit.dart';
import 'package:truuco/extensions/list.dart';

class Deck {
  List<Card> cards;

  Deck(this.cards);

  get size => cards.length;

  factory Deck.spanish() {
    List<String> symbols = ["4", "5", "6", "10", "J", "Q", "K", "A", "2", "3"];
    
    List<Card> cards = [];
    
    for (var suit in Suit.values) {
      cards.addAll(
        List.generate(
          symbols.length, 
          (index) => Card(
            symbol: symbols[index],
            power: index,
            suit: suit
          )
        )
      );
    }

    cards.shuffle();

    return Deck(cards);
  }

  shuffle() => cards.shuffle();

  pick() => cards.pick();
}