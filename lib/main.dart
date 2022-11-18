import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/screens/connection_screen.dart';

import 'provider/provider_setup.dart';

void main() {
   runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ConnectionScreen(),
    );
  }
}

