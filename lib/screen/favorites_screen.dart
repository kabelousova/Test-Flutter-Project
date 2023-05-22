import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../favorites_model.dart';
import '../model/pokemon_model.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Pokemon> favorites = context.watch<FavoritesModel>().favorites ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          Pokemon pokemon = favorites[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(pokemon: pokemon))),
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
                        Text(pokemon.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: TextButton(
                            onPressed: () {
                              context.read<FavoritesModel>().remove(pokemon);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.favorite, color: Colors.blue),
                                SizedBox(width: 3),
                                Text('DISLIKE', style: TextStyle(color: Colors.blue)),
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
        },
      ),
    );
  }
}
