import 'package:flutter/material.dart';
import 'package:restaurant/states/create_account.dart';
import 'package:restaurant/states/login.dart';
import 'package:restaurant/widgets/bg_theme.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (context) => Login(),
  '/createAccount': (context) => CreateAccount(),
};

String? initRoute;

void main() {
  initRoute = '/login';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute:  initRoute,
      title: 'Demo Restaurant',
    );
  }
}
