import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/cart.dart';
import 'package:flutter_login_ui/controllers/lottery.dart';
import 'package:flutter_login_ui/controllers/order.dart';
import 'package:flutter_login_ui/controllers/ticket.dart';
import 'package:flutter_login_ui/models/lottery.dart';
import 'package:flutter_login_ui/models/ticket/ticket_request_model.dart';
import 'package:flutter_login_ui/pages/widgets/cart_item.dart';
import 'package:get/get.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class CartPage extends StatelessWidget {
  final List<Lottery> lotterylist;

  const CartPage({Key? key, required this.lotterylist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    var orderController = Get.put(OrderController());
    var ticketController = Get.put(TicketController());
    var lotteryController = Get.put(LotteryController());

    List<dynamic> lotteryNumbers = json.decode(lotterylist[0].lotteryNumbers);
    print(lotteryNumbers);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.5,
      ),
      body: GetBuilder<CartController>(
        init: CartController(),
        builder: (cont) => Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 20, color: Color(0XFF303996)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text(
                        '${cartController.totalAmount.toStringAsFixed(2)} Birr',
                        style: TextStyle(
                            color: Color(0XFFfcd804),
                            fontWeight: FontWeight.w600),
                      ),
                      backgroundColor: Color(0XFF303996),
                    ),
                    Spacer(),
                    GetBuilder<OrderController>(
                        init: OrderController(),
                        builder: (context) {
                          return GetBuilder<TicketController>(
                              init: TicketController(),
                              builder: (context) {
                                return GetBuilder<LotteryController>(
                                    init: LotteryController(),
                                    builder: (context) {
                                      return TextButton(
                                        onPressed: () async {
                                          //orderController.addOrder(
                                          //  cartController.items.values
                                          //    .toList(),
                                          //cartController.totalAmount);
                                          String? _res = await UssdAdvanced
                                              .sendAdvancedUssd(code: "*804#");
                                          const String start = "is ";
                                          const String end = " Birr";
                                          var startIndex = _res!.indexOf(start);
                                          var endIndex = _res.indexOf(
                                              end, startIndex + start.length);

                                          var balance = _res.substring(
                                              startIndex + start.length,
                                              endIndex);
                                          var balanceNo = double.parse(balance);
                                          if (balanceNo <
                                              cartController.totalAmount) {
                                            Get.snackbar("Order unsuccessful.",
                                                "You don't have enough balance.",
                                                backgroundColor: Colors.red,
                                                shouldIconPulse: true,
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          } else {
                                            UssdAdvanced.sendUssd(
                                                code: "*806*0942230327*1#",
                                                subscriptionId: 1);
                                            for (var i = 0;
                                                i < cartController.items.length;
                                                i++) {
                                              ticketController.buyTicket(
                                                  cartController.items.values
                                                      .toList()[i]
                                                      .ticketNum);
                                              // remove the tickets user selected from the lotteries list
                                              lotteryNumbers.remove(
                                                  cartController.items.values
                                                      .toList()[i]
                                                      .ticketNum);
                                              // update the lottery list after the tickets are removed from the list
                                              lotteryController.updateLottery(
                                                  lotterylist[0].id,
                                                  json.encode(lotteryNumbers));
                                            }
                                            cartController.clear();

                                            Get.snackbar("Order",
                                                "Click 1 to confirm buying your ticket.",
                                                backgroundColor:
                                                    Color(0XFFfcd804),
                                                shouldIconPulse: true,
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          }
                                        },
                                        child: Text(
                                          'ORDER NOW',
                                          style: TextStyle(
                                              color: Color(0XFF303996),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      );
                                    });
                              });
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartController.items.length,
                itemBuilder: (context, index) => CartItem(
                  DateTime.now().toString(),
                  cartController.items.values.toList()[index].ticketNum,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
