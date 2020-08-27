import 'package:example/views/alert_view.dart';
import 'package:example/widgets/custom_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      CustomTheme(
        initialThemeKey: MyThemeKeys.LIGHT,
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.of(context),
      home: AlertView(),
    );
  }
}
