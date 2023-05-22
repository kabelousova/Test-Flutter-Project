import 'package:flutter/material.dart';
import '../model/pokemon_model.dart';

class DetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  DetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.network(pokemon.frontImageUrl),
                  ),
                  Expanded(
                    child: Image.network(pokemon.backImageUrl),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Name:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    pokemon.name,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Weight:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    pokemon.weight.toString(),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Height:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    pokemon.height.toString(),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    pokemon.order.toString(), //todo,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Base Experience:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    pokemon.baseExperience.toString(),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Types',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    for (String type in pokemon.types)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            type,
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abilities',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    for (String ability in pokemon.abilities)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ability,
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
