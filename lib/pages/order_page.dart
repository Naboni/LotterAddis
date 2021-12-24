import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/ticket.dart';
import 'package:flutter_login_ui/models/ticket.dart';
import 'package:flutter_login_ui/models/user.dart';
import 'package:flutter_login_ui/pages/widgets/header_widget.dart';
import 'package:flutter_login_ui/pages/widgets/order_item.dart';
import 'package:flutter_login_ui/services/auth/api_service.dart';
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
      body: FutureBuilder(
          future: ApiService.getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Text('no data');
              } else {
                User user = snapshot.data;

                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        GetBuilder<TicketController>(
                            init: TicketController(),
                            builder: (builder) {
                              if (ticketController.isLoading.value)
                                return Container(
                                  padding: EdgeInsets.all(10),
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              else {
                                List<Ticket> userTicket = ticketController
                                    .ticketList
                                    .where((ticket) => ticket.userId == user.id)
                                    .toList();
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        child: HeaderWidget(
                                            200, true, Icons.attach_money),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 9),
                                        child: Text(
                                          "Total Amount: ${(userTicket.length * 5.00).toStringAsFixed(2)} Birr",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 9),
                                        child: Text(
                                          "You'll get notified as soon as the winner lottery is rolled. Stay tuned and try your luck. Cause you never know, maybe today is your lucky day.",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                            shrinkWrap: false,
                                            itemCount: userTicket.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 18),
                                                child: ListTile(
                                                    tileColor: Colors.white,
                                                    leading: Icon(
                                                      Icons.attach_money,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                    title: Text(
                                                        "Ticket No: ${userTicket[index].ticketNumber}"),
                                                    subtitle:
                                                        Text("Amount: 5 Birr"),
                                                    trailing: Container(
                                                      child: Text(
                                                        "${userTicket[index].status}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      decoration: BoxDecoration(
                                                        color: Colors.amber,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    )

                                                    // Icon(
                                                    //   Icons.pending,
                                                    //   color: Colors.amber,
                                                    // ),
                                                    ),
                                              );
                                            }),
                                      ),
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
                        //Obx(() {
                        //})
                      ],
                    ),
                  ),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.none) {
              return Text('None'); // error
            } else {
              return Center(child: CircularProgressIndicator()); // loading
            }
          }),
    );
  }
}
