import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};

  Map<String, CartItem> get items {
      return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalCost {
    double total = 0;
    _items.forEach((key, item) { 
      total += item.quantity*item.price;
    });
    return total;
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void addItem(String productId, double price, String title){
    if(_items.containsKey(productId)){
      _items.update(productId, (existingItem) =>CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          quantity: existingItem.quantity+1
        )
      );

    }
    else
    {
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(), 
        title: title, 
        quantity: 1, 
        price: price)
      );
    }
    notifyListeners();
  }

  void clearCart(){
    _items = {};
    notifyListeners();
  }
}