import 'package:flutter/material.dart';
import 'package:push_local/src/pages/hhtp_request.dart';
import 'package:push_local/src/pages/home_pages.dart';
import 'package:push_local/src/pages/mensaje_page.dart';
import 'package:push_local/src/providers/push_notifications_provider.dart';

void main() =>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey= new GlobalKey<NavigatorState>();

  @override
  void initState(){
    super.initState();

    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();

    pushProvider.mesdajes.listen((argumento){
      //Navigator.pushNamed(context, 'mensaje');
      print('Este es el argumento');
      //* hcaer todo *//
      print(argumento);
      
      navigatorKey.currentState.pushNamed('mensaje',arguments: argumento);

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Materil App',
      initialRoute: 'home',
      routes: {
        'home':(BuildContext context)=>HomePage(),
        'mensaje': (BuildContext context)=>MessagePage(),
        'httprequest': (BuildContext context)=>HttpRequest(),
      },
    );
  }
}
