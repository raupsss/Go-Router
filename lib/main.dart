import 'package:flutter/material.dart';
import 'package:flutter_go_router/screens/category_screen.dart';

import 'config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
      // home: CategoryScreen();
    );
  }
}
