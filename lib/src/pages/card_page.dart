import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        //padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        children: <Widget>[_cardTipo1(), SizedBox(height: 30.0), _cardTipo2()],
      ),
    );
  }

  _cardTipo1() {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Esto es una titulo de loa tarjeta'),
            subtitle: Text('esto es el subtitulo de la tarjeta'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("canclar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("ok"),
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }

  _cardTipo2() {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('No tengo idea de que poner'))
        ],
      ),
    );
  }
}
