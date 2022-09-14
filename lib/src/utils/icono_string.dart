//Ocupo hacer un metodo que reciba un String y me retorne un icono
import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input_outlined,
  'tune': Icons.tune_outlined
};
// sintaxis para definir un mapa
Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blueAccent,
  );
}
//ESTA ES UNA UTILIDAD