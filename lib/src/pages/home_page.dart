//import 'dart:js';

import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/providers/menu_provider.dart';
import 'package:componentes_flutter/src/utils/icono_string_utils.dart';
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
    //print(menuProvider.opciones);
    /*menuProvider.cargarData().then((opciones) {
      print('_lisdta');
      print(opciones);
    });
    */

    return FutureBuilder(
        future: menuProvider.cargarData(),
        initialData: [], // argumento opcional,
        // es algo que nos permite dibujar algo en la pantalla de nuestro despositivo
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(children: _listaItem(snapshot.data, context));
        });

    /*return ListView(
      children: _listaItem(),
    );*/
  }

  List<Widget> _listaItem(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
