import 'package:flutter/material.dart';
import 'package:map_mark/screen/tienda_product.dart';

enum TiendaState { normal, details, cart }

class TiendaStoreBloc with ChangeNotifier {
  TiendaState tiendaState = TiendaState.normal;
  List<TiendaProduct> catalog = tiendaProducts;
  List<TiendaProductItem> cart = [];
  void changeToNormal() {
    tiendaState = TiendaState.normal;
    notifyListeners();
  }

  void changeToDetails() {
    tiendaState = TiendaState.details;
    notifyListeners();
  }

  void changeToCart() {
    tiendaState = TiendaState.cart;
    notifyListeners();
  }

  void addProduct(TiendaProduct product) {
    cart.add(TiendaProductItem(productItem: product));
    notifyListeners();
  }

  where(Function(dynamic item) param0) {}
}

class TiendaProductItem {
  TiendaProductItem({this.quantity = 1, required this.productItem});
  final int quantity;
  final TiendaProduct productItem;

  void add() {}
}
