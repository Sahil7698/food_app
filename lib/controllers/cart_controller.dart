import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../models/cart_model.dart';

class CartController extends ChangeNotifier {
  RxList addedProduct = [].obs;

  get totalQuantity {
    int quantity = 0;

    addedProduct.forEach((element) {
      quantity += element.que as int;
    });

    return quantity;
  }

  get totalPrice {
    double totalPrice = 0;

    addedProduct.forEach((element) {
      totalPrice += element.que * element.price;
    });

    return totalPrice;
  }

  void addProduct({required CartModel product}) {
    addedProduct.add(product);
    notifyListeners();
  }

  void removeProduct({required CartModel product}) {
    addedProduct.remove(product);
    notifyListeners();
  }

  void addQue({required CartModel product}) {
    product.qty++;
    notifyListeners();
  }

  void removeQue({required CartModel product}) {
    (product.qty > 1) ? product.qty-- : addedProduct.remove(product);
    notifyListeners();
  }
}
