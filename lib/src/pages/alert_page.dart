import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Alertas'),
      ),
      body: Center(
        child: ElevatedButton(
          // quiero que al tocar el boton salga la alerta
          child: Text('mostrar alerta'),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_sharp),
        onPressed: () {
          Navigator.pop(context); //Boton de regreso
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    // barries Simissible es para que se cierre si se toca afuera
    showDialog(
      context: context,
      barrierDismissible: true, // si dejo en false no puedo cerrar la alerta
      builder: (context) {
        return AlertDialog(
          shape: //Bordes de la alerta
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Titulo'),
          // content: Text('Contenido de la alerta'),
          actions: <Widget>[
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  //formas de cerrar la alera
                  Navigator.of(context).pop();
                },
                child: Text("Aceptar")),
          ],
          content: Column(
            //para evitar que se estire la alerta con la columna
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de la alerta'),
              //logo flutter
              FlutterLogo(
                size: 100.0,
              )
            ],
          ),
        );
      },
    );
  }
}
