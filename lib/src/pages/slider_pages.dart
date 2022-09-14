import 'package:flutter/material.dart';

//Ocupo que sea un staful para trabajar con el estado
class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorDefecto = 100.0;
  double? _valor2 = 100.0;
  bool _activarAumento = false;
  // valor dinamico que cambia conforme se mueva el slider

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simulador de Zoom Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearImagen(),
            _crearCheckBox(),
            _crearSwitch(),
          ],
        ),
      ),
    );
  }

//Este widget inplica actualzar la pagina
  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.black,
      label: 'Nivel de agrado con el sistema',
      divisions: 20,
      value: _valorDefecto,
      min: 15.0,
      max: 400.0,
      onChanged: (_activarAumento)
          ? null // if ternario
          : (valor) {
              setState(() {
                _valorDefecto = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.lavanguardia.com/files/og_thumbnail/uploads/2019/06/04/5e99794702a16.jpeg'),
      width: _valorDefecto,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
      title: Text('Simulador de zoom'),
      value: _activarAumento,
      onChanged: (val) {
        setState(() {
          _activarAumento = val!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: Text('Switch'),
      value: _activarAumento,
      onChanged: (val) {
        setState(() {
          _activarAumento = val;
        });
      },
    );
  }
}
