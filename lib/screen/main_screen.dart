import 'package:flutter/material.dart';
import 'package:pokemon_app4/screen/component/pokemon_box.dart';
import '../model/pokemon_model.dart';
import '../favorites_model.dart';
import '../api_service.dart';
import 'favorites_screen.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scrollController = ScrollController();
  final _apiService = PokemonApiService();
  List<String> _pokemonUrlsDetailList = [];
  int nextPokemon = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    fetchUrls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen()));
            },
          ),
        ],
      ),
      body: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: _pokemonUrlsDetailList.length,
        itemBuilder: (context, index) {
          String pokemonUrlDetail = _pokemonUrlsDetailList[index];
          return FutureBuilder<Pokemon>(
              future: _apiService.getPokemonDetails(pokemonUrlDetail),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Pokemon pokemon = snapshot.data!;
                  bool isFavorite = context
                          .watch<FavoritesModel>()
                          .favorites
                          ?.contains(pokemon) ??
                      false;
                  return PokemonBox(pokemon: pokemon, isFavorite: isFavorite);
                } else {
                  return CircularProgressIndicator();
                }
              });
        },
      ),
    );
  }

  Future<void> fetchUrls() async {
    var pokemonUrls = await _apiService.getPokemonUrls(nextPokemon);
    setState(() {
      _pokemonUrlsDetailList += pokemonUrls;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels > 0.8 * _scrollController.position.maxScrollExtent) {
      nextPokemon += _apiService.limit;
      fetchUrls();
    }
  }
}
