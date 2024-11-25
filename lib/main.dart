import 'package:flutter/material.dart';
import 'package:pixabay_apicalling/provider/home_provider.dart';
import 'package:pixabay_apicalling/view/home.dart';
import 'package:pixabay_apicalling/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            ));
  }
}
