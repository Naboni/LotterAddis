import 'package:flutter_login_ui/pages/forgot_password_verification_page.dart';
import 'package:flutter_login_ui/pages/registration_page.dart';
import 'package:get/get.dart';

import 'pages/_pages.dart';

class Routes {
  static final routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/register', page: () => RegistrationPage()),
    GetPage(name: '/lottery', page: () => LotteryPage()),
    GetPage(name: '/orders', page: () => OrderPage()),
    GetPage(name: '/tickets', page: () => TicketsPage()),
    GetPage(name: '/winner', page: () => WinnerPage()),
    GetPage(name: '/privacy', page: () => ForgotPasswordVerificationPage())
  ];
}
