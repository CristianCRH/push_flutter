import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HttpRequest extends StatelessWidget {
  final String serverToken = 'AAAA2WgApNU:APA91bG7GU-gGYhxwAKC1HdTEdi8yxtWVmLQ7FMXhZzCZ8i1kjTrN0HLGbS1FqcNiCOULPXLFoBXDepd3vlBrO1Fk81In9di9T07hHEzsHdkLONX0trlBUUvrmiYcueJvbkoc26M4HRQ';
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  Future<Map<String, dynamic>> sendAndRetrieveMessage() async {
    await firebaseMessaging.requestNotificationPermissions(
      const IosNotificationSettings(sound: true,badge: true,alert: true),
    );
    await http.post(
      'https://fcm.googleapis.com/fcm/send',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'this is a body',
            'title': 'this is a title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1238',
            'status': 'done'
          },
          'to': 'c6yf7EqIVQ4:APA91bE9yXOrQh0fsOUBu9Q4wus_ydOOt0112RFZQ-ytbX1F8Et9qzJ4cI5VBlTXimvOYXkDf-385U8YxHI0hNro660OLHn3Zg9K3WkvTpWwVtEUVEdPQfg1K0icEpttoM4MZJ_6jeH-',
        },
      ),
    );

    final Completer<Map<String, dynamic>> completer =
    Completer<Map<String, dynamic>>();

    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        completer.complete(message);
      },
    );

    return completer.future;
  }

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
                onPressed:sendAndRetrieveMessage,
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
