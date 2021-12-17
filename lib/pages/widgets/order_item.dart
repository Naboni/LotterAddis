import 'package:flutter/material.dart';
import 'package:flutter_login_ui/models/order.dart';
import 'package:flutter_login_ui/models/ticket.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class OrderItem extends StatefulWidget {
  final List<Ticket> order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Total: ${(widget.order.length * 5).toStringAsFixed(2)} Birr',
              style: TextStyle(
                  color: Color(0XFF303996), fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              //DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
              DateFormat('dd/MM/yyyy hh:mm').format(DateTime.now()),
              style: TextStyle(
                  color: Color(0XFF303996), fontWeight: FontWeight.w600),
            ),
            trailing: IconButton(
              icon: Icon(
                _isExpanded ? Icons.expand_less : Icons.expand_more,
                color: Color(0XFF303996),
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order.length * 20 + 10, 180),
              child: ListView(
                children: widget.order
                    .map(
                      (ticket) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                              'Ticket Number: ${ticket.ticketNumber.toString()}',
                              style: TextStyle(
                                  color: Color(0XFF303996),
                                  fontWeight: FontWeight.w600)),
                          Text('5 Birr',
                              style: TextStyle(
                                  color: Color(0XFF303996),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
