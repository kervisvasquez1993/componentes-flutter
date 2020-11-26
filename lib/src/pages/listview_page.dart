import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // controlador del scroll de la lista
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumero = new List();
  int _ultimoNumero = 0;

  @override
  void initState() {
    // TODO: implement initState
    // esto es un metodo que no regresa nada
    super.initState(); //<--- esto hace referencia a la clase State
    _agregar10();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //print('final');
        _agregar10();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListWiew'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      //itemBuilder se encarga de redibujar los elementos que se encuentra dentro de esta lista
      controller: _scrollController,
      itemCount: _listaNumero.length, // CUANTOS ELEMENTO TIENE ESTA LISTA
      itemBuilder: (BuildContext context, int index) {
        final imagen = _listaNumero[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300?random=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoNumero++;
      _listaNumero.add(_ultimoNumero);
      setState(() {});
    }
  }
}
