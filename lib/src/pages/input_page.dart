import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
//propiedad para capturar los datos
  String _nombre = '';
  String _correo = '';
  String _contrasenna = '';
  //Selector de fecha
  //String _fecha = '';
  List<String> _paises = ['Argentina', ' Belgica', 'Noruega', 'Nigeria'];
  String _opcionMenu = 'Argentina'; //Tiene que esta en la lista

  //Nueva propiedad para el calendario, permite manejar la relacion con la caja de texto
  //TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo Inputs'),
      ),
      //Se crea un listView porque por lo general lo que se encuentra en una
      //caja de texto despliega el teclado
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),

          _email(),
          Divider(),
          _password(),
          Divider(),
          //   _crearFecha(context),
          _dropDown(), // es como un combo box
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

//TextField trabaja mejor independiente y el TextFormField es para formularios
  Widget _crearInput() {
    //Para que se ponga automatico el foco
    //  autofocus: true,
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //etiqueta que aparece abajo
          counter: Text('Caracteres: ${_nombre.length}'),
          //texto de sugerencia
          hintText: 'Nombre del usuario',
          //label
          labelText: 'Nombre',
          //texto de ayuda
          helperText: 'Texto de ayuda, similar a tooltip',
          //icono que aparece dentro del input
          suffixIcon: Icon(Icons.accessibility),
          //
          icon: Icon(Icons.person)),

      onChanged: (valor) {
        //va a redibujar el widget por cada letra
        setState(() {
          _nombre = valor;
          //print(_nombre);
        });
      },
      //Ahora quiero capturar el texto como tal
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre de la persona :$_nombre'),
      subtitle: Text('Correo de la persona :$_correo'),
      trailing: Text(_opcionMenu),
    );
  }

  Widget _email() {
    // se muestra el arroba en el teclado
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //etiqueta que aparece abajo
          //texto de sugerencia
          hintText: 'Email',
          //label
          labelText: 'Email',
          //texto de ayuda
          //icono que aparece dentro del input
          suffixIcon: Icon(Icons.alternate_email),
          //
          icon: Icon(Icons.email)),

      onChanged: (valor) {
        //va a redibujar el widget por cada letra
        setState(() {
          _correo = valor;
          //print(_nombre);
        });
      },
      //Ahora quiero capturar el texto como tal
    );
  }

  Widget _password() {
    return TextField(
      //keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //etiqueta que aparece abajo
          //texto de sugerencia
          hintText: 'Password',
          //label
          labelText: 'Password',
          //texto de ayuda
          //icono que aparece dentro del input
          suffixIcon: Icon(Icons.lock_clock),
          //
          icon: Icon(Icons.lock)),

      onChanged: (valor) {
        //va a redibujar el widget por cada letra
        setState(() {
          _contrasenna = valor;
          //print(_nombre);
        });
      },
      //Ahora quiero capturar el texto como tal
    );
  }

  List<DropdownMenuItem<String>> getSelecciones() {
    List<DropdownMenuItem<String>> listaTemp = []; // Lista dinamica
    _paises.forEach((pais) {
      listaTemp.add(DropdownMenuItem(
        child: Text(pais),
        value: pais,
      ));
      //child es lo que se muestra, value es el valor y key es una referencia
    });
    return listaTemp;
  }

  Widget _dropDown() {
    //los items son obligatorios y el onchange, las lista puede ser de cualquier cosa
    return Row(
      children: <Widget>[
        Icon(Icons.arrow_drop_down),
        SizedBox(width: 25.0),
        Expanded(
          child: DropdownButton(
            value: _opcionMenu,
            items: getSelecciones(),
            onChanged: (String? seleccion) {
              setState(() {
                _opcionMenu =
                    seleccion!; // se le coloca el ! para indicar un tipo
              });
            },
          ),
        ),
      ],
    );
  }

/*
  Widget _crearFecha(BuildContext context) {
    return TextField(
      //keyboardType: TextInputType.visiblePassword,
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //etiqueta que aparece abajo
          //texto de sugerencia
          hintText: 'Fecha nacimiento',
          //label
          labelText: 'Fecha nacimiento',
          //texto de ayuda
          //icono que aparece dentro del input
          suffixIcon: Icon(Icons.calendar_today),
          //
          icon: Icon(Icons.calendar_today_outlined)),

      onTap: () {
        //quitar el foco
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
      //Ahora quiero capturar el texto como tal
    );
  }
*/
/*
//porque el showData regresa un future
  _selectDate(BuildContext context) async {
    DateTime? seleccionado = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      // locale: Locale('es', 'ES')
    );

    if (seleccionado != null) {
      setState(() {
        _fecha = seleccionado.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
  */
}
