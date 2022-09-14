//Hara referencia al archivo json que creamos
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

//Se le pone el show rootBundle
//Para solo hacer visible el paquete en especifico
class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }
  /*
  Future va retornar segundos despues 
  */

/*
Para leer el archivo json ocupo un paquete que viene en Flutter
*/
  Future<List<dynamic>> cargarData() async {
    //Esto regresa un future, es una lista dynamic
    final respuesta = await rootBundle.loadString('data/menu_opciones.json');

    /*
        rootBundle.loadString('data/menu_opciones.json')
        .then((data) {
      //print(data);
      //Vamos a convertir esta data, que es un string con formato json  en un objeto
      Map dataMap = json.decode(data);
      print(dataMap['rutas']);
      //rutas son las que ocupo almacenar en lista de opcipnes
      opciones = dataMap['rutas'];
    });
    */

    Map dataMap = json.decode(respuesta);
    // print(dataMap['rutas']);
    //rutas son las que ocupo almacenar en lista de opcipnes
    opciones = dataMap['rutas'];
    return opciones;
  }
}

//instancia de la clase
/* Para el de los inputs modificar el json */
final menuProvider = _MenuProvider();
