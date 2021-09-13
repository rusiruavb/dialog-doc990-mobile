import 'package:dialog_doc990_mobile/providers/sign_up_provider.dart';
import 'package:dialog_doc990_mobile/route_generator.dart';
import 'package:dialog_doc990_mobile/screens/home/home_screen.dart';
import 'package:dialog_doc990_mobile/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => SignUpProvider())],
        child: DocApp(),
      ),
    );

class DocApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(
        navigationPage: HomeScreen(),
        duration: 2,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
