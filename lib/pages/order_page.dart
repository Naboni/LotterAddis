import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/order.dart';
import 'package:flutter_login_ui/controllers/ticket.dart';
import 'package:flutter_login_ui/pages/widgets/drawer.dart';
import 'package:flutter_login_ui/pages/widgets/order_item.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  var ticketController = Get.put(TicketController());

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
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ListView.builder(
                        itemCount: ticketController.lotteryList.length,
                        itemBuilder: (BuildContext ctx, int index) =>
                            OrderItem(ticketController.lotteryList),
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
