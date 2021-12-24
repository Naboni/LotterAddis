import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/cart.dart';
import 'package:flutter_login_ui/controllers/lottery.dart';
import 'package:flutter_login_ui/models/models.dart';
import 'package:flutter_login_ui/pages/cart_page.dart';
import 'package:get/get.dart';

class LotteryPage extends StatelessWidget {
  final lotteryController = Get.put(LotteryController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    List<Lottery> lotteries = lotteryController.lotteryList;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.jpg'),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
        actions: [
          GetBuilder<CartController>(
              init: CartController(),
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    if (cartController.itemCount != 0) {
                      Get.to(
                        () => CartPage(
                          lotterylist: lotteries,
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 16,
                      right: 16,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          color: Color(0XFF303996),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Color(0XFFfcd804),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: Text(
                              '${cartController.itemCount.toString()}',
                              style: TextStyle(
                                color: Color(0XFF303996),
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
      // AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   title: Image.asset('assets/images/logo.jpg'),
      // ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Obx(
                () {
                  if (lotteryController.isLoading.value)
                    return Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  else {
                    return Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                          itemCount: lotteries.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            var lottery =
                                json.decode(lotteries[index].lotteryNumbers);
                            print(lottery);
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: lottery.length,
                              //itemCount: lotteries.length,
                              itemBuilder: (BuildContext ctex, int i) {
                                return GetBuilder<CartController>(
                                  init: CartController(),
                                  builder: (context) {
                                    return new GestureDetector(
                                      onTap: () {
                                        cartController.addItem(lottery[i]);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 10),
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0XFFfcd804),
                                              width: 2),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              //"l",
                                              "${lottery[i]}",
                                              style: TextStyle(
                                                color: Color(0XFF303996),
                                                fontSize: 24,
                                              ),
                                            ),
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Color(0XFF303996),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }),
                    );
                    //lotteries.map((lottery) => LotteryList(
                    //  lotNumbers: json.decode(lottery.lotteryNumbers), cartController: cartController)
                    // ).toList();
                    // print(lotNumbers);
                    // List lotNumbers = json.decode(lotteries[1].lotteryNumbers);
                  }
                },
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
                          "Buy Ticket",
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
                          //return _showDialog(context);
                          if (cartController.itemCount != 0) {
                            Get.to(() => CartPage(lotterylist: lotteries));
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        "5 ETB will be cut from your balance when you buy a ticket",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFF303996)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
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
          height: MediaQuery.of(context).size.height * 0.15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your lottery number is:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF303996),
                ),
              ),
              Text(
                "10002518596",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF303996),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "The winner will be known on Thursday 3:00 GMT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF303996),
                ),
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  "Buy more ticket",
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
