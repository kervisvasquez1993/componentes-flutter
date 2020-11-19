import 'package:componentes_flutter/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    print(menuProvider.opciones);
    return ListView(
      children: _listaItem(),
    );
  }

  List<Widget> _listaItem() {
    return [
      ListTile(
        title: Text('Hola mundo'),
      ),
      Divider(),
      ListTile(
        title: Text('Hola mundo'),
      ),
      ListTile(
        title: Text('Hola mundo'),
      ),
      Divider(),
      ListTile(
        title: Text('Hola mundo'),
      ),
    ];
  }
}
