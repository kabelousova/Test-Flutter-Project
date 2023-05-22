import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/main_screen.dart';
import 'favorites_model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child: MaterialApp(
        title: 'Pokemon App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
