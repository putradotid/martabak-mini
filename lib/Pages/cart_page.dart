import 'package:auth_firebase/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:auth_firebase/bloc/cart/cart_event.dart'; 
import 'package:auth_firebase/bloc/cart/cart_state.dart'; 

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'My Cart',
            style: GoogleFonts.sora(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2F2D2C),
            ),
          ),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            // Kalau masih kosong
            if (state.items.isEmpty) {
              return const Center(
                child: Text("Keranjang masih kosong"),
              );
            }

            // Kalau ada item di keranjang
            return Column(
              children: [
                // Daftar Item
                Expanded(
                  child: ListView(
                    children: [
                      ...state.items.map((item) => ListTile(
                            leading: const Icon(Icons.shopping_bag_outlined),
                            title: Text(item.name),
                            subtitle: Text("${item.quantity} x Rp${item.price}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => context
                                  .read<CartBloc>()
                                  .add(RemoveFromCart(item.id)),
                            ),
                          )),
                    ],
                  ),
                ),

                // Divider & Total
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Total: Rp${state.totalPrice}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () =>
                            context.read<CartBloc>().add(ClearCart()),
                        icon: const Icon(Icons.delete_forever),
                        label: const Text("Kosongkan Keranjang"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
),

      ),
    );
  }

  // 🔹 Widget item produk
  Widget _buildCartItem({
    required String image,
    required String title,
    required String subtitle,
    required double price,
    required int quantity,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEAEAEA))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2F2D2C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    color: const Color(0xFF9B9B9B),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                '\$ ${price.toStringAsFixed(2)}',
                style: GoogleFonts.sora(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _circleButton(Icons.remove),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      quantity.toString(),
                      style: GoogleFonts.sora(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _circleButton(Icons.add),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🔹 Baris ringkasan pembayaran
  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // 🔹 Tombol plus/minus bulat
  Widget _circleButton(IconData icon) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, size: 16, color: const Color(0xFF2F2D2C)),
    );
  }
}
