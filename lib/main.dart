import 'package:app_inventory/routers/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Inventory',
      initialRoute: Routes.initialRoute,
      routes: Routes.getAppRoutes(),
      onGenerateRoute: Routes.onGenerateRoute,
      //theme: AppTheme.lightTheme,
    );
  }
}
