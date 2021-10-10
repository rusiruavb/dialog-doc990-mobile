import 'package:dialog_doc990_mobile/providers/appointment_provider.dart';
import 'package:dialog_doc990_mobile/providers/payment_provider.dart';
import 'package:dialog_doc990_mobile/providers/search_doctor_provider.dart';
import 'package:dialog_doc990_mobile/providers/user_provider.dart';
import 'package:dialog_doc990_mobile/route_generator.dart';
import 'package:dialog_doc990_mobile/screens/home/home_screen.dart';
import 'package:dialog_doc990_mobile/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => SearchDoctorProvider()),
          ChangeNotifierProvider(create: (_) => AppointmentProvider()),
          ChangeNotifierProvider(create: (_) => PaymentProvider()),
        ],
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // navigation bar color
      statusBarColor: Colors.red[900], // status bar color
    ));
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
