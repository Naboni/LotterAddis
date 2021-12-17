import 'package:flutter/material.dart';
import 'package:flutter_login_ui/controllers/cart.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int ticketNo;

  CartItem(this.id, this.ticketNo);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartController.removeItem(ticketNo);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Chip(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '5 Birr',
                  style: TextStyle(
                    color: Color(0XFFfcd804),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              backgroundColor: Color(0XFF303996),
            ),
            title: Text("Ticket Number"),
            subtitle: Text('$ticketNo'),
            trailing: GestureDetector(
              child: Icon(
                Icons.clear,
                color: Color(0XFF303996),
              ),
              onTap: () {
                cartController.removeItem(ticketNo);
              },
            ),
          ),
        ),
      ),
    );
  }
}
