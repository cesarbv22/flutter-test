import 'package:componentes1/src/pages/alert_page.dart';
//import 'package:componentes1/src/pages/avatar_page.dart';
//import 'package:componentes1/src/pages/real_home_page.dart';
import 'package:componentes1/src/routes/routes.dart';
import 'package:flutter/material.dart';
//import 'package:componentes1/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mis componentes',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      /*
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatartPage(),
      }, //Si son muchas rutas es mejor hacerlo en un archivo por aparte
      */
      routes: getRutas(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
      //Tengo que poner en routes, un mapa que es esto una llave string y un widgetbuilder
    );
  }
}


/* AnimatedContainer es para ver de forma bonita los cambios que se dan 
PARA SLIDER HAY QUE MODIFICAR EL JSON, las rutas y el util
Repositorio de prueba
*/