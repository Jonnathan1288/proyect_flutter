import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:proyect_app/pages/add_entries.dart';
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
        title: "APP",
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [
          Locale("en"),
          Locale("es"),
        ], //END CHANGE DATE ES--
        theme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(backgroundColor: Colors.grey[900]),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Colors.green,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.green[900],
                foregroundColor: Colors.white),

            // Para los colores de la fecha
            colorScheme: const ColorScheme.dark(primary: Colors.green),
            scaffoldBackgroundColor: Colors.grey[900],
            primaryColorDark: Colors.grey[850]),
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomePage(),
          'addEntries': (_) => const AddEntries()
        });
  }
}
