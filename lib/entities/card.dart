import 'package:truuco/entities/suit.dart';

class Card {
  int power;
  String symbol;
  Suit suit; 

  Card({required this.power, required this.suit, required this.symbol});
}