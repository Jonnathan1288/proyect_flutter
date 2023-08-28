import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyect_app/pages/home_page.dart';
import 'package:proyect_app/providers/ui_provider.dart';

void main() {
  //IMPLEMENT FO PROVIDER..
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UIProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        theme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.green,
            ),
            scaffoldBackgroundColor: Colors.grey[900],
            primaryColorDark: Colors.grey[850]),
        initialRoute: 'home',
        routes: {'home': (_) => const HomePage()});
  }
}
