import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/cart.dart';
import 'package:flutter_login_ui/controllers/ticket.dart';
import 'package:flutter_login_ui/controllers/user.dart';
import 'package:flutter_login_ui/models/models.dart';
import 'package:get/get.dart';

class TicketsPage extends StatelessWidget {
  static const routeName = "/tickets";

  final ticketController = Get.put(TicketController());
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    List<Ticket> tickets = ticketController.ticketList;
    //List lotNumbers = json.decode(lotteries[0].lotteryNumbers);
    bool clicked = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tickets",
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
              Obx(
                () {
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
                          itemCount: tickets.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundColor: Colors.amber,
                                  child: Icon(
                                    Icons.person,
                                    color: Theme.of(context).primaryColor,
                                  )
                                  //Text("${tickets[index].userId.toString()}"),
                                  ),
                              title: Text(
                                  "Ticket No. ${tickets[index].ticketNumber.toString()}"),
                              subtitle: Text(
                                  "Ticket id: ${tickets[index].id.toString()}"),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {},
                              ),
                            );
                          }),
                    );
                  }
                },
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
