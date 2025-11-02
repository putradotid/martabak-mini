import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';
import '../widgets/custom_bottom_nav.dart';
import '../pages/home_page.dart';
import '../pages/cart_page.dart';
import '../pages/orders_page.dart';
import '../pages/profile_page.dart';
import '../pages/chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Daftar halaman yang akan ditampilkan sesuai index bottom nav
  final List<Widget> _pages = const [
    HomePage(),
    CartPage(),
    OrdersPage(),
    ProfilePage(),
    ChatPage(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons-kompres.png',
              height: 50, // bisa disesuaikan
              width: 50,
            ),
            const SizedBox(width: 8),
            Text(
              'Martabak Mini',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
          ],
        ),
        // centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      // Ganti tampilan berdasarkan tab yang dipilih
      body: _pages[_selectedIndex],

      // Navigasi bawah
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
