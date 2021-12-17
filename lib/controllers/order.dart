import 'package:flutter_login_ui/models/cart_item.dart';
import 'package:flutter_login_ui/models/order.dart';
import 'package:flutter_login_ui/models/ticket.dart';
import 'package:flutter_login_ui/services/auth/api_service.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var isLoading = true.obs;
  var lotteryList = List<Ticket>.empty(growable: true).obs;
  List<Order> _orders = [];

  @override
  void onInit() {
    fetchTickets();
    //getAllTickets();
    super.onInit();
  }

  List<Order> get orders {
    return [..._orders];
  }

  void fetchTickets() async {
    try {
      isLoading(true);
      var tickets = await ApiService.getTicketById();
      if (tickets != null) {
        lotteryList.value = tickets;
      }
    } finally {
      isLoading(false);
    }
  }

  void addOrder(List<CartItem> cartProducts, double total) async {
    //var currentBalance = await UssdServiceReq.sendUssdRequest("*804#");
    //if(currentBalance! < total)
    _orders.insert(
      0,
      Order(
        orderId: DateTime.now().toString(),
        amount: total,
        tickets: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    update();
  }
}
