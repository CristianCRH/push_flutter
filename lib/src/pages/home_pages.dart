import 'package:flutter/material.dart';
import 'package:push_local/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Home Page'),
     ),
     body: Center(
       child: Column(
          mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           const SizedBox(height: 30),
           RaisedButton(
             onPressed: (){
               Navigator.of(context).pushNamed('httprequest');
             },
             child: const Text(
               'Enables Button',
               style: TextStyle(
                 fontSize:20
               ),
             ),
           ),
           const SizedBox(height: 30,),
           RaisedButton(
             onPressed: (){

             },
             child: const Text(
               'Mostrar snkbr',
               style: TextStyle(
                 fontSize: 25,
               ),
             ),
           ),
         ],
       ),
     ),
   );
  }
}
