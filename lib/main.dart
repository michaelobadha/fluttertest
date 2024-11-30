
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/property_list.dart';
import 'views/property_details.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PropertyList(),
        '/details': (context) => PropertyDetails(),
      },
    );
  }
}
