import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/lottery.dart';
import 'package:flutter_login_ui/controllers/ticket.dart';
import 'package:flutter_login_ui/services/notification_api.dart';
import 'package:flutter_login_ui/services/notification_service.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class GenerateLotteryPage extends StatefulWidget {
  @override
  State<GenerateLotteryPage> createState() => _GenerateLotteryPageState();
}

class _GenerateLotteryPageState extends State<GenerateLotteryPage> {
  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }

  final lotteryController = Get.put(LotteryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Generate Lottery",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "Generate Lottery",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFFfcd804)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0XFF303996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    _showDialog(context, lotteryController);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "Simple Notification",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFFfcd804)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0XFF303996),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () => NotificationApi.showNotification(
                    title: 'Naboni Abebe',
                    body: 'Hey! Boni notification seralek',
                    payload: "Naboni",
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  NotificationService().cancelAllNotifications();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "Cancel All Notifications",
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  NotificationService().showNotification(1, "LotterAddis",
                      "Try your luck. Tody might be your lucky day.", 10);
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.green,
                  child: Center(
                    child: Text("Show Notification"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, LotteryController lotteryController) {
  lotteryController.generateLotteries();
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: new Text(
            "Successful!",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0XFF303996),
            ),
          ),
        ),
        content: Container(
          child: Text(
            "Generated Lottery Numbers.",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0XFF303996),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        actions: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFFfcd804)),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0XFF303996),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      );
    },
  );
}
