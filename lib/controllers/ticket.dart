import 'package:flutter_login_ui/models/models.dart';
import 'package:flutter_login_ui/services/auth/api_service.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  var isLoading = true.obs;
  var lotteryList = List<Ticket>.empty(growable: true).obs;
  var ticketList = List<Ticket>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchTickets();
    getAllTickets();
    super.onInit();
  }

  void getAllTickets() async {
    try {
      isLoading(true);
      var tickets = await ApiService.getAllTickets();
      if (tickets != null) {
        ticketList.value = tickets;

        //ticketList.assignAll(tickets);
      }
    } finally {
      isLoading(false);
    }
  }

  List<Ticket> findProductById(int id) {
    return ticketList.where((i) => i.userId == id).toList();
  }

  void fetchTickets() async {
    try {
      isLoading(true);
      var tickets = await ApiService.getTicketById();
      if (tickets != null) {
        lotteryList.value = tickets;

        //lotteryList.assignAll(tickets);
      }
    } finally {
      isLoading(false);
    }
  }

  void buyTicket(int ticketNumber) async {
    try {
      var ticket = await ApiService.buyTicket(ticketNumber);
      lotteryList.add(ticket!);
      ticketList.add(ticket);
    } catch (e) {
      print(e);
    }
  }

  void updateStatus(String status, String id) async {
    try {
      await ApiService.updateTicket(status, id);
    } catch (e) {
      print(e);
    }
  }

  void deleteAllTickets() async {
    try {
      await ApiService.deleteTickets();
    } catch (e) {
      print(e);
    }
  }
}
