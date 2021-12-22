import 'dart:convert';

import 'package:flutter_login_ui/config.dart';
import 'package:flutter_login_ui/models/auth/login_request_model.dart';
import 'package:flutter_login_ui/models/auth/login_response_model.dart';
import 'package:flutter_login_ui/models/auth/register_request_model.dart';
import 'package:flutter_login_ui/models/auth/register_response_model.dart';
import 'package:flutter_login_ui/models/lottery.dart';
import 'package:flutter_login_ui/models/models.dart';
import 'package:flutter_login_ui/models/ticket/ticket_request_model.dart';
import 'package:flutter_login_ui/models/user.dart';
import 'package:flutter_login_ui/services/shared_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.loginApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      //Store in SHARED
      await SharedService.setLoginDetails(loginResponseModel(response.body));
      return true;
    } else {
      print("A net error");
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiUrl, Config.registerApi);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return registerResponseModel(response.body);
  }

  static Future<User?> getUser() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${loginDetails!.token}'
    };

    var userId = Config.userProfile + loginDetails.id.toString();

    var url = Uri.http(Config.apiUrl, userId);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return userModel(response.body);
    } else {
      return null;
    }
  }

  static Future<User?> getUserById(int id) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${loginDetails!.token}'
    };

    var userId = Config.userProfile + id.toString();

    var url = Uri.http(Config.apiUrl, userId);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return userModel(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Lottery>?> getLottery() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.lotteryApi);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    var jsonData = json.decode(response.body);

    List<Lottery> allLotteries = [];

    for (var jdata in jsonData) {
      Lottery lotteries = Lottery(
        id: jdata["id"],
        lotteryNumbers: jdata["lotteryNumbers"],
        userId: jdata["userId"],
      );
      allLotteries.add(lotteries);
    }

    if (response.statusCode == 200) {
      return allLotteries;
    } else {
      return null;
    }
  }

  static Future<List<User>?> getUsers() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': '${loginDetails!.token}'
    };

    var url = Uri.http(Config.apiUrl, Config.userProfile);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    var jsonData = json.decode(response.body);

    List<User> allUsers = [];

    for (var jdata in jsonData) {
      User users = User(
          id: jdata["id"],
          firstName: jdata["firstName"],
          lastName: jdata["lastName"],
          email: jdata["email"],
          phone: jdata["phone"],
          gender: jdata["gender"],
          age: jdata["age"],
          role: jdata["role"],
          lottery: jdata["lottery"],
          ticket: jdata["ticket"]);
      allUsers.add(users);
    }

    if (response.statusCode == 200) {
      return allUsers;
    } else {
      return null;
    }
  }

  static Future<List<Ticket>?> getAllTickets() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.ticketApi);
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    var jsonData = json.decode(response.body);

    List<Ticket> allTickets = [];

    for (var jdata in jsonData) {
      Ticket ticket = Ticket(
        id: jdata["id"],
        ticketNumber: jdata["ticketNumber"],
        userId: jdata["userId"],
      );
      allTickets.add(ticket);
    }

    if (response.statusCode == 200) {
      return allTickets;
    } else {
      return null;
    }
  }

  static Future<List<Ticket>?> getTicketById() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(
        Config.apiUrl, Config.ticketApi + "${loginDetails!.id.toString()}");
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    var jsonData = json.decode(response.body);

    List<Ticket> allTicket = [];

    for (var jdata in jsonData) {
      Ticket ticket = Ticket(
        id: jdata["id"],
        ticketNumber: jdata["ticketNumber"],
        userId: jdata["userId"],
      );

      allTicket.add(ticket);
    }

    if (response.statusCode == 200) {
      return allTicket;
    } else {
      return null;
    }
  }

  static Future<Ticket?> buyTicket(int ticketNumber) async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.ticketApi);
    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(<String, int>{
        "ticketNumber": ticketNumber,
        "userId": loginDetails!.id
      }),
    );

    return ticketModel(response.body);
  }

  static Future<void> deleteTickets() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiUrl, Config.ticketApi);
    await client.delete(
      url,
      headers: requestHeaders,
    );

    return null;
  }

  static Future<Lottery?> updateLottery(
      int lotteryId, String lotteryNumbers) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url =
        Uri.http(Config.apiUrl, Config.lotteryApi + "${lotteryId.toString()}");

    var response = await client.patch(
      url,
      headers: requestHeaders,
      body: jsonEncode(<String, String>{
        "lotteryNumbers": lotteryNumbers,
      }),
    );

    if (response.statusCode == 200) {
      return lotteryModel(response.body);
    } else {
      return null;
    }
  }
}
