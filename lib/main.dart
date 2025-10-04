import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/image_bloc.dart';
import 'data/image_repository.dart';
import 'ui/home_screen.dart';

void main() {
  final ImageRepository repository = ImageRepository();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ImageRepository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC API Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => ImageBloc(repository),
        child: const HomeScreen(),
      ),
    );
  }
}
