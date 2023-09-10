import 'package:flutter/material.dart';
import 'package:teste/primeira.dart';

void main() {
  runApp(const MyApp());
}

// classe que inicia o aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // define Material Design
    return const MaterialApp(
      title: 'Sample Input', home: Forms(title: '',), // inicia página principal
    );
  }
}

// Classe que instância classe responsável por gerenciar estados


