import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/lottery_page.dart';
import 'package:flutter_login_ui/pages/widgets/category_card.dart';
import 'package:flutter_login_ui/pages/widgets/drawer.dart';
import 'package:get/get.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map> users = [
      {
        "id": 1,
        "name": "Thomas Guta",
        "money": "305,000",
        "profile": "assets/images/profile6.gif"
      },
      {
        "id": 2,
        "name": "Dishta Gina",
        "money": "177,000",
        "profile": "assets/images/profile2.jpg"
      },
      {
        "id": 3,
        "name": "Ruha Glad",
        "money": "15,500",
        "profile": "assets/images/profile4.jpg"
      },
      {
        "id": 4,
        "name": "Xelc Clex",
        "money": "225,000",
        "profile": "assets/images/profile5.jfif"
      },
      {
        "id": 5,
        "name": "Alex Sima",
        "money": "35,000",
        "profile": "assets/images/profile7.jpg"
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.jpg'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
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
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/money.png"),
                          fit: BoxFit.fill,
                          colorFilter: new ColorFilter.mode(
                            Colors.white.withOpacity(0.4),
                            BlendMode.dstATop,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Text(
                          "It might be your lucky day.",
                          style: TextStyle(
                            color: Color(0XFF303996),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "Give it a try!",
                          style: TextStyle(
                            color: Color(0XFF303996),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "WIN",
                          style: TextStyle(
                            color: Color(0XFF303996),
                            fontSize: 48,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              text: '250,000',
                              style: TextStyle(
                                  color: Color(0XFFfcd804),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' ETB',
                                  style: TextStyle(
                                      color: Color(0XFFfcd804), fontSize: 18),
                                )
                              ]),
                        ),
                        Spacer()
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        child: Text(
                          "Start Playing",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0XFFfcd804)),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0XFF303996),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LotteryPage()),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Text(
                        "00:06:45",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF303996)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xfffef2ac),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Previous winners",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF303996)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemCount: users.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new AssetImage(
                                        "${users[index]["profile"]}"),
                                  ),
                                ),
                              ),
                              Text(
                                "${users[index]["name"]}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0XFF303996),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "${users[index]["money"]}",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0XFF303996),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
