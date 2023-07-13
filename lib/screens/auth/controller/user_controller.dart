import 'package:beyride/model/user/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _user = Rxn<User>();

  User? get user => _user.value;

  set user(User? newUser) => _user.value = newUser;
}
