import 'package:flutter/material.dart';
import 'package:national_id/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:Directionality(
        textDirection: TextDirection.ltr,
        child: HomeScreen(),
      )
    );
  }
}
