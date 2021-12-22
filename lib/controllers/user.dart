import 'package:flutter_login_ui/models/models.dart';
import 'package:flutter_login_ui/services/auth/api_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = List<User>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await ApiService.getUsers();
      if (users != null) {
        userList.value = users;
      }
    } finally {
      isLoading(false);
    }
  }

  User findUserById(int id) {
    return userList.firstWhere((element) => element.id == id);
  }
}
