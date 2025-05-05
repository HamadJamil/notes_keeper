import 'package:flutter/material.dart';
import 'package:notes_keeper/data/local/database_helper.dart';
import 'package:notes_keeper/provider/data_base_provider.dart';
import 'package:notes_keeper/provider/theme_provider.dart';
import 'package:notes_keeper/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create:
              (_) =>
                  DataBaseProvider(databaseHelper: DatabaseHelper.getInstance),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode:
          context.watch<ThemeProvider>().isDarkTheme()
              ? ThemeMode.dark
              : ThemeMode.light,
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      home: SplashScreen(),
    );
  }
}
