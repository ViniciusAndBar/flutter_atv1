import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Formulário e SharedPreferences')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Endereço',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _numberController,
                decoration: InputDecoration(
                  labelText: 'Número',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _complementController,
                decoration: InputDecoration(
                  labelText: 'Complemento',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: 'Estado',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40, // Altura desejada do TextField
              width: 450,
              child: TextField(
                controller: _siteController,
                decoration: InputDecoration(
                  labelText: 'Site',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 35, // Altura desejada do ElevatedButton
              width: 150, // Largura desejada do ElevatedButton
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 35, // Altura desejada do ElevatedButton
              width: 150, // Largura desejada do ElevatedButton
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Recuperar',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 35, // Altura desejada do ElevatedButton
              width: 150, // Largura desejada do ElevatedButton
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Limpar',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _salvarData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('address', _addressController.text);
    await prefs.setString('number', _numberController.text);
    await prefs.setString('complement', _complementController.text);
    await prefs.setString('city', _cityController.text);
    await prefs.setString('state', _stateController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('site', _siteController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Informações salvas no dispositivo')),
    );
  }

  Future<void> _recuperarData() async {
    final prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString('name') ?? '';
    _addressController.text = prefs.getString('address') ?? '';
    _numberController.text = prefs.getString('number') ?? '';
    _complementController.text = prefs.getString('complement') ?? '';
    _cityController.text = prefs.getString('city') ?? '';
    _stateController.text = prefs.getString('state') ?? '';
    _emailController.text = prefs.getString('email') ?? '';
    _siteController.text = prefs.getString('site') ?? '';
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Informações recuperadas do dispositivo')),
    );
  }

  Future<void> _limparData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _nameController.text = '';
    _addressController.text = '';
    _numberController.text = '';
    _complementController.text = '';
    _cityController.text = '';
    _stateController.text = '';
    _emailController.text = '';
    _siteController.text = '';
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Informações apagadas do dispositivo')),
    );
  }
}
