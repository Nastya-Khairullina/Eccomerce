import 'package:flutter/cupertino.dart';
import '../../domain/entities/product_entity.dart';

class CartDataProvider extends ChangeNotifier  {
  static List<ProductEntity> items = [];

  int index = 0;
  int number = items.length;


  void add (ProductEntity item) {
    items.add(item);
    debugPrint ('${items.length}');
    notifyListeners();
  }
  void deleteItem (ProductEntity item){
    items.remove([index]);
    notifyListeners();
  }
  void clear() {
    items = [];
  }

  double get totalAmount {
    var total = 0.0;
    for (var item in items) {
      total += (item.price! * items.length) as double;
    }

    return total;
  }



}
