import 'package:flutter_login_ui/models/models.dart';
import 'package:flutter_login_ui/models/user_profile.dart';
import 'package:flutter_login_ui/services/auth/api_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userProfile = UserProfile().obs;
  var otherUsers = UserProfile().obs;

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  void fetchUserData() async {
    try {
      isLoading(true);
      var user = await ApiService.getUser();
      var userProf = user;
      if (user != null) {
        userProfile = userProf as Rx<UserProfile>;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchUserById(int id) async {
    try {
      isLoading(true);
      var user = await ApiService.getUserById(id);
      var userProf = user;
      if (user != null) {
        otherUsers = userProf as Rx<UserProfile>;
      }
    } finally {
      isLoading(false);
    }
  }
}
