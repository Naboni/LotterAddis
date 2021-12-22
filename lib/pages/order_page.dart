import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/ticket.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';
import 'package:flutter_login_ui/pages/widgets/order_item.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  final ticketController = Get.put(TicketController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Orders",
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
          child: Container(
            child: Column(
              children: [
                Obx(() {
                  if (ticketController.isLoading.value)
                    return Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  else {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            child: HeaderWidget(200, true, Icons.attach_money),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 9),
                            child: Text(
                              "Total Amount: ${(ticketController.lotteryList.length * 5.00).toStringAsFixed(2)} Birr",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 9),
                            child: Text(
                              "You'll get notified as soon as the winner lottery is rolled. Stay tuned and try your luck. Cause you never know, maybe today is your lucky day.",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                shrinkWrap: false,
                                itemCount: ticketController.lotteryList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 18),
                                    child: ListTile(
                                        tileColor: Colors.white,
                                        leading: Icon(
                                          Icons.attach_money,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        title: Text(
                                            "Ticket No: ${ticketController.lotteryList[index].ticketNumber}"),
                                        subtitle: Text("Amount: 5 Birr"),
                                        trailing: Container(
                                          child: Text(
                                            "Pending",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        )
                                        // Icon(
                                        //   Icons.pending,
                                        //   color: Colors.amber,
                                        // ),
                                        ),
                                  );
                                }),
                          )
                          // Container(
                          //   height: MediaQuery.of(context).size.height * 0.45,
                          //   child: ListView.builder(
                          //     itemCount: ticketController.lotteryList.length,
                          //     itemBuilder: (BuildContext ctx, int index) =>
                          //         OrderItem(ticketController.lotteryList),
                          //   ),
                          // ),
                        ],
                      ),
                    );
                  }
                })
              ],
            ),
          ),
        )
        // GetBuilder<TicketController>(
        //   init: TicketController(),
        //   builder: (context) {
        //     return ListView.builder(
        //       itemCount: ticketController.lotteryList.length,
        //       itemBuilder: (context, index) =>
        //           OrderItem(ticketController.lotteryList),
        //     );
        //   },
        // ),
        );
  }
}
