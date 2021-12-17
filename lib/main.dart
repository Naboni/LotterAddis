import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/home_page.dart';
import 'package:flutter_login_ui/pages/login_page.dart';
import 'package:flutter_login_ui/pages/registration_page.dart';
import 'package:flutter_login_ui/services/shared_service.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/splash_screen.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get result of the login function.
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const HomePage();
  }

  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      //home: SplashScreen(title: 'Flutter Login UI'),
      routes: {
        '/': (context) => _defaultHome,
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegistrationPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
