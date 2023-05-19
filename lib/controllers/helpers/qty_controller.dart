import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/qty_model.dart';

class QuentityController extends GetxController {
  QuentityModel quentity = QuentityModel(qty: 1);

  void increment() {
    quentity.qty++;
    update();
  }

  void dicrement() {
    (quentity.qty > 1) ? quentity.qty-- : null;
    update();
  }

  void empty() {
    quentity.qty = 1;
    update();
  }
}
