import 'package:componentes_flutter/src/pages/alert_page.dart';
import 'package:componentes_flutter/src/pages/avatar_page.dart';
import 'package:componentes_flutter/src/pages/home_page.dart';
import 'package:componentes_flutter/src/routes/routes.dart';
//import 'package:componentes_flutter/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      //home: HomePage()
      initialRoute: '/',
      routes: getAplicationRoutes(),
      //si no esta definida las ruta se dispara el onGenerateRoute
      onGenerateRoute: (RouteSettings settings) {
        print("la ruta llamada: ${settings.name}");
        return MaterialPageRoute(
            builder: (BuildContext context) => AvatarPage());
      },
    );
  }
}
