import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../favorites_model.dart';
import '../../model/pokemon_model.dart';
import '../detail_screen.dart';

class PokemonBox extends StatelessWidget {
  final Pokemon pokemon;
  final bool isFavorite;

  PokemonBox({super.key, required this.pokemon, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(pokemon: pokemon))),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.black, width: 1),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black, width: 1),
                    // borderRadius: BorderRadius.circular(8),
                    ),
                child: Image.network(pokemon.frontImageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(pokemon.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (isFavorite) {
                          context.read<FavoritesModel>().remove(pokemon);
                        } else {
                          context.read<FavoritesModel>().add(pokemon);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite,
                              color: isFavorite ? Colors.blue : Colors.blue),
                          SizedBox(width: 4),
                          Text(isFavorite ? 'DISLIKE' : 'LIKE',
                              style: TextStyle(
                                  color:
                                      isFavorite ? Colors.blue : Colors.blue)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
