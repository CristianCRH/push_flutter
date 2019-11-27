import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'dart:io';
class PushNotificationProvider{
  FirebaseMessaging _fb = FirebaseMessaging();
  final _messagesStreamController=StreamController<String>.broadcast();//capturar data
  Stream<String> get mesdajes=>_messagesStreamController.stream;
  initNotifications(){
    _fb.requestNotificationPermissions();
    _fb.getToken().then((token){
      print('=== FMC Token ===');
      print(token);
      //c6yf7EqIVQ4:APA91bE9yXOrQh0fsOUBu9Q4wus_ydOOt0112RFZQ-ytbX1F8Et9qzJ4cI5VBlTXimvOYXkDf-385U8YxHI0hNro660OLHn3Zg9K3WkvTpWwVtEUVEdPQfg1K0icEpttoM4MZJ_6jeH-
    });

    _fb.configure(
      //cuando la aplication está abierta
      onMessage:(info){
        print('====== ON MESSAGE ======');
        print(info);

        String argumento= 'no-data';
        if(Platform.isAndroid){
          argumento= info['data']['id']??'no-data';
        }
        _messagesStreamController.sink.add(argumento);
      },
      //cuando la aplicacion está terminada  
      onLaunch: (info){
        print('====== ON LAOUNCH ======');

        final noti=info['data']['id']??'no-data';
        _messagesStreamController.sink.add(noti);

      },
      onResume:(info){
        print('====== ON RESUME ======');
        print(info);

        final noti=info['data']['id']??'no-data';
       _messagesStreamController.sink.add(noti);
      }
    );
  }

  dispose(){
    _messagesStreamController?.close();
  }
}