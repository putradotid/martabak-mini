import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth_firebase/bloc/menu/menu_event.dart'; 
import 'package:auth_firebase/bloc/menu/menu_state.dart'; 
import 'package:auth_firebase/data/menu_items.dart'; 

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuState()) {
    on<LoadMenu>((event, emit) {
      emit(state.copyWith(items: menuItems)); // ambil semua menu
    });

    on<FilterMenuByCategory>((event, emit) {
      if (event.category == 'All') {
        emit(state.copyWith(
          items: menuItems,
          selectedCategory: 'All',
        ));
      } else {
        final filtered = menuItems
            .where((item) => item['category'] == event.category)
            .toList();
        emit(state.copyWith(
          items: filtered,
          selectedCategory: event.category,
        ));
      }
    });
  }
}
