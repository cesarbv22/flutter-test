import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          _cardTipoA(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipoB(),
          SizedBox(
            height: 30.0,
          ),
          /*
          _cardTipoA(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipoB(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipoA(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipoB(),
          SizedBox(
            height: 30.0,
          ),
          */
        ],
      ),
    );
  }

  Widget _cardTipoA() {
    return Card(
      elevation: 15.0, // que tan alto esta la tarjeta con relacion a la sombra
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album_outlined,
              color: Colors.green,
            ),
            title: Text('Titulo de las Tarjetas'),
            subtitle:
                Text('Subtitulo de las descripcion en la pagina de cards'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Aceptar'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipoB() {
    final card = Container(
      //Usar placeholder mientras la imagen original carga de algun lugar
      child: Column(
        children: <Widget>[
          //Placeholder es la imagen que debe estar en el equipo, la que esta en assets
          FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
              height: 300.0,
              fit:
                  BoxFit.cover, //Que la imagen se adapte al ancho total posible
              image: NetworkImage(
                  'https://images6.alphacoders.com/568/thumb-1920-568500.jpg')),
          // editar el pubspec.yaml

          //Image(
          //  image:
          //    NetworkImage('https://wallpaperaccess.com/full/170249.jpg')),
          Container(
              padding: EdgeInsets.all(12.0),
              child: Text('Texto de la imagen')) // control + . wrap container
          //Copiar la url de la imagen landscape
        ],
      ),
    );
    return Container(
      // contenedor que imita una tarjeta
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.white,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0,
                    10.0) // es como un plano cartesiano para mover la sombra
                ), //Es como una sombra
          ]),
      child: ClipRRect(
        // permite cortar lo que se sale de los bordes
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    ); //container es como un div
  }
}
