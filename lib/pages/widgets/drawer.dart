import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/forgot_password_verification_page.dart';
import 'package:flutter_login_ui/pages/home_page.dart';
import 'package:flutter_login_ui/pages/lottery.dart';
import 'package:flutter_login_ui/pages/order_page.dart';
import 'package:flutter_login_ui/pages/profile_page.dart';
import 'package:flutter_login_ui/pages/tickets_page.dart';
import 'package:flutter_login_ui/pages/ussd_page.dart';
import 'package:flutter_login_ui/pages/winner_page.dart';
import 'package:flutter_login_ui/services/shared_service.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color _draFont = Color(0XFFfcd804);
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
              0.0,
              1.0
            ],
                colors: [
              Theme.of(context).primaryColor.withOpacity(0.2),
              Theme.of(context).accentColor.withOpacity(0.5),
            ])),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).accentColor,
                  ],
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child:
                    // Image.asset("assets/images/logo2.jpg")
                    Text(
                  "LotterAddis",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.screen_lock_landscape_rounded,
            //     size: _drawerIconSize,
            //     color: Theme.of(context).accentColor,
            //   ),
            //   title: Text(
            //     'Splash Screen',
            //     style: TextStyle(
            //         fontSize: 17, color: Theme.of(context).accentColor),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) =>
            //                 SplashScreen(title: "Splash Screen")));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.login_rounded,
            //       size: _drawerIconSize, color: Theme.of(context).accentColor),
            //   title: Text(
            //     'Login Page',
            //     style: TextStyle(
            //         fontSize: _drawerFontSize,
            //         color: Theme.of(context).accentColor),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => LoginPage()),
            //     );
            //   },
            // ),
            // Divider(
            //   color: Theme.of(context).primaryColor,
            //   height: 1,
            // ),
            // ListTile(
            //   leading: Icon(Icons.person_add_alt_1,
            //       size: _drawerIconSize, color: Theme.of(context).accentColor),
            //   title: Text(
            //     'Registration Page',
            //     style: TextStyle(
            //         fontSize: _drawerFontSize,
            //         color: Theme.of(context).accentColor),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => RegistrationPage()),
            //     );
            //   },
            // ),
            // Divider(
            //   color: Theme.of(context).primaryColor,
            //   height: 1,
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.password_rounded,
            //     size: _drawerIconSize,
            //     color: Theme.of(context).accentColor,
            //   ),
            //   title: Text(
            //     'Forgot Password Page',
            //     style: TextStyle(
            //         fontSize: _drawerFontSize,
            //         color: Theme.of(context).accentColor),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
            //     );
            //   },
            // ),
            // Divider(
            //   color: Theme.of(context).primaryColor,
            //   height: 1,
            // ),
            ListTile(
              leading: Icon(
                Icons.home,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.monetization_on_rounded,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Lottery',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LotteryPage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.list_alt,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Order',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderPage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.format_align_justify,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Tickets',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketsPage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Winner is',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WinnerPage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.list_alt,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Ussd',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UssdPage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.verified_user_sharp,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Privacy',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordVerificationPage()),
                );
              },
            ),
            Divider(
              color: Theme.of(context).primaryColor,
              height: 1,
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                size: 24,
                color: Theme.of(context).accentColor,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                    fontSize: 17, color: Theme.of(context).accentColor),
              ),
              onTap: () {
                //SystemNavigator.pop();
                SharedService.logout(context);
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Text(
                "Version 1.0.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
