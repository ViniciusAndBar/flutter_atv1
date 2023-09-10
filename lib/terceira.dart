import 'package:flutter/material.dart';
import 'package:teste/quarta.dart';
import 'primeira.dart';

class ThirdPage extends StatelessWidget {
  final String item;
  const ThirdPage({Key? key, required this.item})
      : super(key: key);
  

  
  static const Color borderColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item,
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const SizedBox(
                height: 16.0),
            const SizedBox(
                // label para primeiro número
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number, // tipo de entrada
                  decoration: InputDecoration(
                    // customização
                    hintText: 'Quantidade', //hint
                    prefixIcon:
                        Icon(Icons.add), //icon
                    enabledBorder: OutlineInputBorder(
                      //borda ao redor da entrada
                      borderSide: BorderSide(color: borderColor), //cor da borda
                    ), //quando receber o foco, altera cor da borda
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                )),
            
            const SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FourthPage()),
                );
              },
              child: const Text('Próxima'),
            ),
          ],
        ),
      ),
    );
  }
}