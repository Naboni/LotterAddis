import 'package:flutter_login_ui/models/cart_item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  Map<int, CartItem> _items = {};
  Map<int, CartItem> get items => {..._items};
  int get itemCount => _items.length;
  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += 5;
    });
    return total;
  }

  void addItem(int ticketNumber) {
    if (_items.containsKey(ticketNumber)) {
      _items.update(
        ticketNumber,
        (value) => CartItem(ticketNum: value.ticketNum),
      );
    } else {
      _items.putIfAbsent(
        ticketNumber,
        () => CartItem(ticketNum: ticketNumber),
      );
    }
    update();
  }

  void removeItem(int ticketNumber) {
    _items.remove(ticketNumber);
    update();
  }

  void clear() {
    _items = {};
    update();
  }
}
