import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/user.dart';
import 'package:flutter_login_ui/pages/forgot_password_verification_page.dart';
import 'package:flutter_login_ui/pages/lottery_page.dart';
import 'package:flutter_login_ui/pages/order_page.dart';
import 'package:flutter_login_ui/pages/profile_page.dart';
import 'package:flutter_login_ui/pages/tickets_page.dart';
import 'package:flutter_login_ui/pages/winner_page.dart';
import 'package:flutter_login_ui/services/shared_service.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final userController = Get.put(UserController());
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
