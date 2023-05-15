import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';

import 'AppRouteName/app_route_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRouteName.getStarted,
      onGenerateRoute: AppRouteName.generate,
    );
  }
}

