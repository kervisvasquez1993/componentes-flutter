import 'dart:async';
import 'dart:ffi';

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
  bool _isLoading = false;

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
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListWiew'),
        ),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoading()],
        ));
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

  Future fetchData() async {
    _isLoading = true;
    setState(() {
      final duracion = new Duration(seconds: 2);
      new Timer(duracion, respuestaHTTP);
    });
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 50,
      curve: Curves.fastLinearToSlowEaseIn,
      duration: Duration(milliseconds: 250),
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 20.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
