import 'package:dialog_doc990_mobile/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(DocApp());

class DocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red[900],
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
