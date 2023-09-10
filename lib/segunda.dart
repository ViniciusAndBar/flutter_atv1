import 'package:flutter/material.dart';
import 'package:teste/terceira.dart';

class Listp extends StatefulWidget {
  const Listp({super.key, required String title, required String description});

  @override
  FormsState createState() => FormsState();
}

// classe que contém os widgets
class FormsState extends State<Listp> {
  // é necessário um controller para interagir com
  // wigdget de entrada de dados

  Color textColor = Colors.black; // default color
  Color textColorWarning = Colors.grey; // default color
  Color borderColor = Colors.grey;

  bool envio = false;

  //define conteúdo de listView
  final List<String> items = [
    'Produto 1',
    'Produto 2',
    'Produto 3',
    'Produto 4',
    'Produto 5'
  ];
  // controller para input nome
  final TextEditingController _nome = TextEditingController();
  // define cores para mensagens de aviso
  // informações de envio
  String _result = "";
  String _selectItem = "";

  // obtém item selecionado e armazena
  void changeSelectedItem(String e) {
    setState(() {
      _selectItem = e;
      _result = _selectItem;
    });
  }

  // botão de envio
  void _enviar() {
    //obtém informações do usuário
    String nome = _nome.text;
    String selecionado = _selectItem;

    // altera state textColor
    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    // altera cor da borda
    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    // define resposta
    setState(() {
      if (nome == "" || selecionado == "") {
        changeTextColor(Colors.red);
        if (nome == "") {
          _result = "Campo nome obrigatório";
        } else if (selecionado == "") {
          _result = "Campo Item obrigatório";
        }
        //altera cor da borda para indicar
        changeBorderColor(Colors.red);
      } else {
        changeEnvio(true);
        changeTextColor(Colors.red);
        changeBorderColor(Colors.grey);

        _result = nome;
        _selectItem = selecionado;
        _result = '$selecionado $nome';
      }
    });
  }

  // simula envia de informação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Divider(), //linha divisória
            const SizedBox(height: 30.0),
            const Text(
              'Lista de Produtos',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const Divider(), // linha divisória
            //Expanded( if view all items listview
            Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true, // if scroll
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    //leading: Image(image: items[index]),
                    title: Text(items[index]),
                    //subtitle: Text(items[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThirdPage(
                                  item: items[index],
                                )),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
