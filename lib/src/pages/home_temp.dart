import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ["uno", "dos", "tres", "cinco", "cinco"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temps'),
      ),
      body: ListView(
        children: _crearItemsCorto(),
      ),
    );
  }

  List<Widget> _crearItem() {
    List<Widget> lista = new List<Widget>();
    for (var opt in opciones) {
      final tempWidget = ListTile(title: Text(opt));
      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorto() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            subtitle: Text('Cuaqlquier cosa'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
    //return widgets;
  }
}
