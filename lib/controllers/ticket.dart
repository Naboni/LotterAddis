import 'dart:convert';

import 'package:flutter_login_ui/models/models.dart';
import 'package:flutter_login_ui/models/ticket/ticket_request_model.dart';
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
      }
    } finally {
      isLoading(false);
    }
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

  void buyTicket(int ticketNumber) async {
    try {
      var ticket = await ApiService.buyTicket(ticketNumber);
    } catch (e) {
      print(e);
    }
  }

  void deleteAllTickets() async {
    try {
      ApiService.deleteTickets();
    } catch (e) {
      print(e);
    }
  }
}
