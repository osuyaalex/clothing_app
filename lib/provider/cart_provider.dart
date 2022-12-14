import 'package:flutter/cupertino.dart';

import '../model/product model.dart';

class CartProvider extends ChangeNotifier{
  final List<Product> _list = [];
  List<Product> get getItems{
    return _list;
  }
  int? get count{
    return _list.length;
  }

  double get totalPrice{
    var total = 0.00;

    for(var item in _list){
      total+= item.price * item.quantity;
    }
    return total;
  }

  void addItem(
  String name,
  String imageUrl,
  int quantity,
  dynamic price,
  String selectedIcon

      ){
    final product = Product(name, imageUrl, quantity, price, selectedIcon) ;
    _list.add(product);
    notifyListeners();
  }
  void increment(Product product){   //note: Product here is the product model, not the one above, in case it confuses
    product.increase();
    notifyListeners();
  }
  void decrement(Product product){
    product.decrease();
    notifyListeners();
  }
  void clearCart(){
    _list.clear();
    notifyListeners();
  }
}