import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module/presentation/bloc/home_page_bloc.dart';
import 'module/presentation/bloc/home_page_event.dart';
import 'module/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rasterização',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<HomePageBloc>(
        create: (_) => HomePageBloc()..add(RefreshImageEvent()),
        child: const HomePage(),
      ),
    );
  }
}
