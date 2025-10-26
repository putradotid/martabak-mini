import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final coffees = [
      {
        'name': 'Cappuccino',
        'desc': 'With Steamed Milk',
        'price': '\$ 4.20',
        'image': 'assets/icon.png',
        'rating': '4.5',
      },
      {
        'name': 'Cappuccino',
        'desc': 'With Foam',
        'price': '\$ 4.20',
        'image': 'assets/icon.png',
        'rating': '4.2',
      },
      {
        'name': 'Robusta Beans',
        'desc': 'Medium Roasted',
        'price': '\$ 4.20',
        'image': 'assets/icon.png',
        'rating': '3.5',
      },
      {
        'name': 'Cappuccino Beans',
        'desc': 'With Steamed Milk',
        'price': '\$ 4.20',
        'image': 'assets/icon.png',
        'rating': '3.8',
      },
      {
        'name': 'Susu Kocok',
        'desc': 'With Steamed Milk',
        'price': '\$ 4.20',
        'image': 'assets/icon.png',
        'rating': '3.8',
      },
      {
        'name': 'Teh Tarik',
        'desc': 'With Steamed Milk',
        'price': '\$ 4.20',
        'image': 'assets/icon.png',
        'rating': '3.8',
      },
      {
        'name': 'Jeruk Nipis',
        'desc': 'With Steamed Milk',
        'price': '\$ 4.20',
        'image': 'assets/icon.png',
        'rating': '3.8',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white, // 🔹 Ubah ke putih
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Find the best\ncoffee for you",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    color: Colors.black, // 🔹 Warna teks hitam
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // 🔹 Ganti jadi abu muda
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: const TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find Your Coffee...",
                      hintStyle: TextStyle(color: Colors.black45),
                      icon: Icon(Icons.search, color: Colors.black45),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Category Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategory("All", isActive: true),
                    _buildCategory("Martabak"),
                    _buildCategory("Minuman"),
                  ],
                ),
                const SizedBox(height: 16),

                Container(
                width: 315,
                height: 140,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/icon.png"),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                ),
                const SizedBox(height: 16),

                // Coffee Grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: coffees.length,
                  itemBuilder: (context, index) {
                    final coffee = coffees[index];
                    return _buildCoffeeCard(coffee);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(String text, {bool isActive = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.orangeAccent : Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (isActive)
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 4),
            decoration: const BoxDecoration(
              color: Colors.orangeAccent,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  Widget _buildCoffeeCard(Map<String, String> coffee) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // 🔹 Card putih
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
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.asset(
                  coffee['image']!,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                if (coffee['rating']!.isNotEmpty)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star,
                              size: 14, color: Colors.orangeAccent),
                          const SizedBox(width: 2),
                          Text(
                            coffee['rating']!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Coffee info
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee['name']!,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  coffee['desc']!,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      coffee['price']!,
                      style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(8),
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
