import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sushi/pages/intro_page.dart';
import 'package:sushi/pages/menu_page.dart';
import 'package:sushi/models/shop.dart';
import 'package:sushi/models/filter_menu.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Shop>(create: (context) => Shop()),
        ChangeNotifierProvider<FilterMenu>(create: (context) => FilterMenu()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
      },
    );
  }
}
