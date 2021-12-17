import 'package:flutter_login_ui/models/models.dart';

class Order {
  final String orderId;
  final double amount;
  final List<CartItem> tickets;
  final DateTime dateTime;

  Order({
    required this.orderId,
    required this.amount,
    required this.tickets,
    required this.dateTime,
  });
}
