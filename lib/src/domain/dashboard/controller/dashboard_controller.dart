
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var touchedIndex=(-1).obs;

  void updateTouchedIndex(int index){
    touchedIndex.value=index;
  }
}
