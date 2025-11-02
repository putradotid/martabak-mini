import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auth_firebase/bloc/menu/menu_bloc.dart';
import 'package:auth_firebase/bloc/menu/menu_event.dart';
import 'package:auth_firebase/bloc/menu/menu_state.dart';
import 'package:auth_firebase/bloc/cart/cart_bloc.dart';
import 'package:auth_firebase/bloc/cart/cart_event.dart';
import 'package:auth_firebase/models/cart_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MenuBloc()..add(LoadMenu())),
        BlocProvider(create: (_) => CartBloc()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Temukan Martabak Terbaik\nUntukmu",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Category filter
                BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    final bloc = context.read<MenuBloc>();
                    final categories = ['All', 'Martabak', 'Minuman'];

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: categories.map((cat) {
                        final isActive = state.selectedCategory == cat;
                        return GestureDetector(
                          onTap: () => bloc.add(FilterMenuByCategory(cat)),
                          child: Column(
                            children: [
                              Text(
                                cat,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: isActive
                                      ? Colors.orangeAccent
                                      : Colors.black54,
                                ),
                              ),
                              if (isActive)
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  width: 6,
                                  height: 6,
                                  decoration: const BoxDecoration(
                                    color: Colors.orangeAccent,
                                    shape: BoxShape.circle,
                                  ),
                                )
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),

                const SizedBox(height: 20),

                // Menu Grid
                Expanded(
                  child: BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return _buildMenuCard(context, item);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Perhatikan: tambahkan context di parameter
  Widget _buildMenuCard(BuildContext context, Map<String, String> item) {
    final price = double.tryParse(
      item['price']?.replaceAll(RegExp(r'[^0-9.]'), '') ?? '0',
    ) ?? 0.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              item['image']!,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name']!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  item['desc']!,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['price']!,
                      style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(AddToCart(
                          CartItem(
                            id: item['id'] ?? "1",
                            name: item['name'] ?? "Martabak",
                            price: price,
                          ),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
