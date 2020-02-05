import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Log in',
        home: Scaffold(
          appBar: AppBar(
            title: Text('login'),
          ),
          body: Login(),
        ),
      ),
    );
  }
}
