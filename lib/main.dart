import 'package:flutter/material.dart';
import 'package:flutter_cv/src/pages/dashboard_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xffA9A5AF);
    const primaryLight = Color(0xffdbd6e1);
    const primaryDark = Color(0xff7a7680);
    const colorScheme = ColorScheme.light(primary: primaryColor);
    return MaterialApp(
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: colorScheme,
          primaryColor: primaryColor,
          primaryColorLight: primaryLight,
          primaryColorDark: primaryDark,
          canvasColor: Colors.white,
          dividerTheme: const DividerThemeData(
            space: 0,
          ),
          iconTheme: const IconThemeData(
            color: primaryDark,
          ),
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 30,
            ),
          ),
          textTheme: const TextTheme(
            headline5: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
            button: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          primaryTextTheme: const TextTheme(
              bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
        ),
        home: DashboardPage());
  }
}
