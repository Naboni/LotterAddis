import 'dart:convert';

Lottery lotteryModel(String str) => Lottery.fromJson(json.decode(str));

class Lottery {
  Lottery({
    required this.id,
    required this.lotteryNumbers,
    required this.userId,
  });
  late final int id;
  late final String lotteryNumbers;
  late final int userId;

  Lottery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lotteryNumbers = json['lotteryNumbers'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['lotteryNumbers'] = lotteryNumbers;
    _data['userId'] = userId;
    return _data;
  }
}
