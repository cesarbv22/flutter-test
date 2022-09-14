import 'package:componentes1/src/pages/alert_page.dart';
import 'package:componentes1/src/providers/menu_provider.dart';
import 'package:componentes1/src/utils/icono_string.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body:
          _lista(), // al darle control +. se puede crear el metodo. Esto devolvera un listView
    ); // Control + z arregla la tabulacion
  }

  Widget _lista() {
    //print(menuProvider.opciones); // Solo se va a mostrar 1 vez porque se hizo
//SOlo se muestra una vez porque se llama a la instancia- constructur, solo se hace una vez
    //menuProvider.cargarData();

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], //initial data es la informacion por defecto mientras se resuelve
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        // builder se dispara en varias etapas> cuando pide datos, cuando los optiene
        //o cuando da error
        return ListView(
          children: _listaOpciones(snapshot.data, context),
        );
      },
    );
    //La propiedad future del future builder debe estar enlazada a nuestro Future cargar
    //Datos

    // lo que ocupamos es leer un archivo json para agregar todas las opciones
  }

// Future tiene varios estados: cuando pide informacion, cuando resuelve o da error
  List<Widget> _listaOpciones(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    data?.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.red),
        onTap: () {
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
          //Context es el buildContext que usamos y la ruta
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      opciones.add(widgetTemp);
      opciones.add(Divider());
    });
    return opciones;
  }
} //stless
