import 'package:flutter/material.dart';

class HttpRequest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TITULO DENTRO DE APPBAR'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[

             Container(
               padding: EdgeInsets.all(10),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title message',
                    ),
                ),
             ),

             Container(
               padding: EdgeInsets.all(10),
               child: TextField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Body message',
                 ),
               ),
             ),

            Center(
              child: RaisedButton(
                onPressed: (){},
                child: const Text(
                  'Enviar notificacion',
                  style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
