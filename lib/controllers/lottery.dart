import 'package:flutter_login_ui/models/lottery.dart';
import 'package:flutter_login_ui/services/auth/api_service.dart';
import 'package:get/get.dart';

class LotteryController extends GetxController {
  var isLoading = true.obs;
  var lotteryList = List<Lottery>.empty(growable: true).obs;
  //var lotteryNumbers = List<dynamic>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchLotteries();
    super.onInit();
  }

  void fetchLotteries() async {
    try {
      isLoading(true);
      var lotteries = await ApiService.getLottery();
      if (lotteries != null) {
        lotteryList.value = lotteries;
      }
    } finally {
      isLoading(false);
    }
    update();
  }

  void updateLottery(int lotteryId, String lotteryNumbers) async {
    try {
      isLoading(true);
      var updatedLottery =
          await ApiService.updateLottery(lotteryId, lotteryNumbers);
      if (updatedLottery != null) {
        lotteryList[0] = updatedLottery;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
