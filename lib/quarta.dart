import 'package:flutter/material.dart';
import 'package:teste/segunda.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100.0), // um retângulo para separar widgets
            const Text(
              // label (texto)
              'Logo',
              style: TextStyle(fontSize: 50.0, color: Colors.blue),
            ),
            const SizedBox(height: 30.0),
            const Text(
              "Pedido Confirmado !",
              style: TextStyle(fontSize: 20.0, color: Colors.black),
            ),
            const SizedBox(
                height: 18.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Listp(
                            title: 'Item Title',
                            description: 'Item description goes here',
                          )),
                );
              },
              child: const Text('Continuar comprando'),
            ),
          ],
        ),
      ),
    );
  }
}