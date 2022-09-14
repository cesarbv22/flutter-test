import 'package:flutter/material.dart';

class AvatartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Siempre dentro del scaffold y dentro del appbar
      appBar: AppBar(
        title: Text('Pagina Avatar'),
        //Parecido al showDialog
        actions: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static.wikia.nocookie.net/hitlerparody/images/a/ab' +
                      '/Homer-simpson.jpg/revision/latest?cb=20180412155103&path-prefix=es'),
              radius: 25.0,
            ),
            padding: EdgeInsets.all(5.0),
          ),
          Container(
            //Margen
            margin: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              child: Text('HS'),
              backgroundColor: Colors.deepPurple,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://phantom-marca.unidadeditorial.es' +
              '/0509cbd44e41f4ffdb98fc8b9867bfe0/resize/1320/f/jpg/assets/' +
              'multimedia/imagenes/2021/05/12/16208494355539.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
