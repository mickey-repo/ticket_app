import 'package:get/get.dart';

class TextExpansionController extends GetxController {
  var isExpended = false.obs;
  void toggleExpansion(){
    isExpended.value = !isExpended.value;
  }
}