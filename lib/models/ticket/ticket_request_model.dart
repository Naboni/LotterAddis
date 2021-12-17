import 'dart:convert';

TicketRequestModel ticketRequestModel(String str) =>
    TicketRequestModel.fromJson(json.decode(str));

class TicketRequestModel {
  TicketRequestModel({
    required this.ticketNumber,
    required this.userId,
  });

  late final int ticketNumber;
  late final int userId;

  TicketRequestModel.fromJson(Map<String, dynamic> json) {
    ticketNumber = json['ticketNumber'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data['ticketNumber'] = ticketNumber;
    _data['userId'] = userId;
    return _data;
  }
}
