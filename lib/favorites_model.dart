import 'package:flutter/foundation.dart';
import 'model/pokemon_model.dart';


class FavoritesModel extends ChangeNotifier {
  List<Pokemon>? favorites;

  FavoritesModel() {
    favorites = [];
  }

  void add(Pokemon pokemon) {
    favorites!.add(pokemon);
    notifyListeners();
  }

  void remove(Pokemon pokemon) {
    favorites!.remove(pokemon);
    notifyListeners();
  }
}