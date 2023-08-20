import 'package:flutter/material.dart';
import 'theme.dart';

import '../presentation/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: const HomePage(),
    );
  }
}
