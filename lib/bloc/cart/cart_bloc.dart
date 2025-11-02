import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_firebase/models/cart_item.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {
    on<AddToCart>((event, emit) {
      final updatedItems = List<CartItem>.from(state.items);
      final index = updatedItems.indexWhere((i) => i.id == event.item.id);

      if (index != -1) {
        updatedItems[index].quantity += 1;
      } else {
        updatedItems.add(event.item);
      }

      emit(CartState(
        items: updatedItems,
        totalPrice: _calculateTotal(updatedItems),
      ));
    });

    on<RemoveFromCart>((event, emit) {
      final updatedItems = state.items.where((i) => i.id != event.id).toList();
      emit(CartState(
        items: updatedItems,
        totalPrice: _calculateTotal(updatedItems),
      ));
    });

    on<ClearCart>((event, emit) {
      emit(CartState.initial());
    });
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
