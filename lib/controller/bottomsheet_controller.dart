import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  final _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  set currentIndex(int index) => _currentIndex.value = index;

  final _temp = Rxn<String>();

  String? get temp => _temp.value;

  set temp(String? value) => _temp.value = value;

  final _play = Rxn<String>();

  String? get play => _play.value;

  set play(String? value) => _play.value = value;

  final _bag = Rxn<String>();

  String? get bag => _bag.value;

  set bag(String? value) => _bag.value = value;

  final _drink = Rxn<String>();

  String? get drink => _drink.value;

  set drink(String? value) => _drink.value = value;
}
