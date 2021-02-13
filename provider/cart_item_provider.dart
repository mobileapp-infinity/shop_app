import 'package:flutter/foundation.dart';
import 'package:shop_app/models/cart_item_model.dart';

class CartItemProvider with ChangeNotifier {
  Map<String, CartItemModel> _items = {};

  Map<String, CartItemModel> get items {
    return {..._items};
  }

  double get getTotalAmount {
    return _items.values.toList().fold(
          0.0,
          (
            previousValue,
            cartItemModel,
          ) =>
              previousValue += cartItemModel.price * cartItemModel.quantity,
        );
  }

  void addItem(
    String productId,
    String title,
    double price,
    int quantity,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingItem) => CartItemModel(
          id: existingItem.id,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItemModel(
          id: productId,
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }
}
