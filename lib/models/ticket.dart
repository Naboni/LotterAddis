import 'dart:convert';

Ticket ticketModel(String str) => Ticket.fromJson(json.decode(str));

class Ticket {
  Ticket({
    required this.id,
    required this.ticketNumber,
    required this.userId,
  });
  late final int id;
  late final int ticketNumber;
  late final int userId;

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketNumber = json['ticketNumber'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['ticketNumber'] = ticketNumber;
    _data['userId'] = userId;
    return _data;
  }
}
