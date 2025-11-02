import 'package:auth_firebase/models/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final double totalPrice;

  CartState({required this.items, required this.totalPrice});

  factory CartState.initial() => CartState(items: [], totalPrice: 0.0);
}
