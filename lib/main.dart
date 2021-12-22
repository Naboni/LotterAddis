import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/home_page.dart';
import 'package:flutter_login_ui/pages/login_page.dart';
import 'package:flutter_login_ui/pages/registration_page.dart';
import 'package:flutter_login_ui/services/shared_service.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/splash_screen.dart';

//Widget _defaultHome = const LoginPage();
Widget _defaultHome = SplashScreen(
  title: "LotterAddis",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get result of the login function.
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const HomePage();
  }

  runApp(LotterAddis());
}

class LotterAddis extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Design color
    //Color _primaryColor = HexColor('#DC54FE');
    //Color _accentColor = HexColor('#8A02AE');
    Color _primaryColor = Color(0XFF303996);
    Color _accentColor = Color(0XFF161853);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LotterAddis',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      //home: SplashScreen(title: 'LotterAddis'),
      routes: {
        '/': (context) => _defaultHome,
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegistrationPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
