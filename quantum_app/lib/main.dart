import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quantum_app/auth_screen.dart';
import 'package:quantum_app/controllers/login_controller.dart';
import 'package:quantum_app/home_screen.dart';
import 'package:quantum_app/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
          child: AuthScreen(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: AuthScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
