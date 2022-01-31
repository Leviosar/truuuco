import 'package:truuco/entities/card.dart';
import 'package:truuco/entities/deck.dart';
import 'package:truuco/entities/player.dart';

class Game {

  int pointsTowin;
  int handSize;
  late Deck deck;
  late List<Player> players;

  Game(int totalPlayers, {this.pointsTowin = 12, this.handSize = 3}) {
    players = List.generate(totalPlayers, (index) => Player(hand: []));
  }

  get over => players.any((player) => player.points >= pointsTowin);

  loop() {
    while (!over) {
      round();
    }
  }

  round() async {
    deck = Deck.spanish();

    for (Player player in players) {
      player.hand = List.generate(handSize, (index) => deck.pick());
    }

    while (players.any((player) => player.hand.isNotEmpty)) {
      Map<Player, Card> played = {};

      for (Player player in players) {
        played[player] = await player.play(); 
      }

      List<MapEntry<Player, Card>> ranking =  played.entries.toList();
      ranking.sort((a, b) => a.value.power.compareTo(b.value.power));

      Player winner = ranking.first.key;

      winner.points++;
    }
  }

}