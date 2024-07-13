import 'dart:developer';

mixin Stats {
  // fields
  int _points = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

  //getters
  int get points => _points;

  Map<String, int> get statsAsMap => {
        "health": _health,
        "defense": _defense,
        "attack": _attack,
        "skill": _skill,
      };

  List<Map<String, String>> get formattedStatList => [
        {"title": "health", "value": _health.toString()},
        {"title": "attack", "value": _attack.toString()},
        {"title": "defense", "value": _defense.toString()},
        {"title": "skill", "value": _skill.toString()},
      ];

// methods
  void increaseStat(String stat) {
    if (_points > 0) {
      log("increase called");
      if (stat == "health") {
        _health++;
      }
      if (stat == "attack") {
        _attack++;
      }
      if (stat == "defense") {
        _defense++;
      }
      if (stat == "skill") {
        _skill++;
      }
      _points--;
    }
  }

  void decreaseState(stat) {
    if (stat == "health" && _health > 5) {
      log("decrease called");
      _health--;
      _points++;
    }
    if (stat == "attack" && _attack > 5) {
      _attack--;
      _points++;
    }
    if (stat == "defense" && _defense > 5) {
      _defense--;
      _points++;
    }
    if (stat == "skill" && _skill > 5) {
      _skill--;
      _points++;
    }
  }

  setStats({required int points, required Map<String, dynamic> stats}) {
    _points = points;

    _health = stats["health"];
    _attack = stats["attack"];
    _defense = stats["defense"];
    _skill = stats["skill"];
  }
}

// Character char = Character(id: "1", name: "character1", slogan: "Slogan1");

// getChar(){
//   print(char.isFav)
// }
