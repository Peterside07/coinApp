import 'package:coinapp/repository/coin_repository.dart';
import 'package:coinapp/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/coin_data_bloc.dart';

void main() {
  runApp(
    BlocProvider<CoinDataBloc>(
      create: (context) => CoinDataBloc(CoinRepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coin App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
