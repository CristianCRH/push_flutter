import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Message Page'),
      ),
      body: Center(
        child: Text(arg),
      ),
    );
  }
}
