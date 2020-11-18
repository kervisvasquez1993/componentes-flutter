import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = [1, 2, 3, 4, "uno", "cinco"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temps'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('titulo del listview'),
          ),
          Divider(),
          ListTile(
            title: Text('titulo del listview'),
          ),
          Divider(),
          ListTile(
            title: Text('titulo del listview'),
          ),
          Divider(),
          ListTile(
            title: Text('titulo del listview'),
          ),
          Divider(),
        ],
      ),
    );
  }
}
