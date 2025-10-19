import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import '../widgets/custom_bottom_nav.dart';
import '../pages/home_page.dart';
import '../pages/card_page.dart';
import '../pages/orders_page.dart';
import '../pages/profile_page.dart';
import '../pages/contact_page.dart';

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
    CardPage(),
    OrdersPage(),
    ProfilePage(),
    ContactPage(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Halo, ${user.email}'),
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
