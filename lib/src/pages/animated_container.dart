//Debe ser un stateful widget para que los cambios disparen la animacion
//stful
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPage createState() => _AnimatedContainerPage();
}

class _AnimatedContainerPage extends State<AnimatedContainerPage> {
  //Ancho, alto, color y el borde que se definiran en el container
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.red;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenedor Animado'),
      ),
      //el contenedor que vemos en pantalla
      // child: Container(
      //AnomatedContanier requiere la duracion, el tiempo en que va a tardar en cambiar de estado
      body: Center(
          child: AnimatedContainer(
        duration: Duration(seconds: 1),
        //Se usa curves como una animacion por defecto
        //curve: Curves.fastOutSlowIn,
        width: _width,
        height: _height,
        decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        onPressed: () {
          _cambiarEstado(); //Boton de regreso
        },
      ),
    );
  }

  void _cambiarEstado() {
    final random = Random();
    setState(() {
      //funcion random del paquete
      _width =
          random.nextInt(250).toDouble(); //Para generar los numeros enteros
      _height = random.nextInt(250).toDouble();
      _color = Color.fromRGBO(
        //or with fromRGBO with fourth arg as _random.nextDouble(),
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
      _borderRadius = new BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
//Hay que modificar el json en data y el archivo de rutas y la utilidades