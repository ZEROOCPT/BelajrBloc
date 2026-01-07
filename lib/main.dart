import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lernvloc/bagundatar.dart';
import 'package:lernvloc/bloc/persegipanjangbloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),

      home: BlocProvider(
        create: (context) => RectangleBloc(),
        child: Bagundatar(),
      ),
    );
  }
}
