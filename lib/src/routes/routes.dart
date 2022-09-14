import 'package:componentes1/src/pages/alert_page.dart';
import 'package:componentes1/src/pages/animated_container.dart';
import 'package:componentes1/src/pages/avatar_page.dart';
import 'package:componentes1/src/pages/card_page.dart';
import 'package:componentes1/src/pages/input_page.dart';
import 'package:componentes1/src/pages/real_home_page.dart';
import 'package:componentes1/src/pages/slider_pages.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatartPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    //es la ruta nueva
  };
}
