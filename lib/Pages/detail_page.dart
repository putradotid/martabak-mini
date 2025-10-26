import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSize = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.050),

            // 🔹 Header Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.chevron_left, color: Color(0xff2F2D2C)),
                  ),
                  Text(
                    'Detail',
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.heart, color: Color(0xff2F2D2C)),
                  ),
                ],
              ),
            ),

            // 🔹 Gambar Produk
            Container(
              width: 315,
              height: 226,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/item.png"),
                ),
              ),
            ),

            // 🔹 Nama & Subjudul
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cappucino",
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2F2D2C),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "with Chocolate",
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff9B9B9B),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Rating dan Icon Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Rating
                  Row(
                    children: [
                      const Icon(Iconsax.star, color: Color(0xffFBBE21), size: 24),
                      const SizedBox(width: 6),
                      Text(
                        "4.8",
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2F2D2C),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text("(230)", style: GoogleFonts.sora(fontSize: 12)),
                    ],
                  ),

                  // Icon-info
                  Row(
                    children: [
                      _iconBox(Icons.beach_access_rounded),
                      const SizedBox(width: 10),
                      _iconBox(Icons.bolt_outlined),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description",
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      text:
                          "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ",
                      style: GoogleFonts.sora(
                        color: const Color(0xff9B9B9B),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.64,
                      ),
                      children: [
                        TextSpan(
                          text: "Read More",
                          style: GoogleFonts.sora(
                            color: const Color(0xffC67C4E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Size Selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Size",
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _CoffeeSize(
                        title: "S",
                        index: 0,
                        selectedSize: selectedSize,
                        onClick: () => setState(() => selectedSize = 0),
                      ),
                      _CoffeeSize(
                        title: "M",
                        index: 1,
                        selectedSize: selectedSize,
                        onClick: () => setState(() => selectedSize = 1),
                      ),
                      _CoffeeSize(
                        title: "L",
                        index: 2,
                        selectedSize: selectedSize,
                        onClick: () => setState(() => selectedSize = 2),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Bottom Bar
            Container(
              height: 121,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Price",
                          style: GoogleFonts.sora(
                              fontSize: 14, color: Color(0xff9B9B9B))),
                      Text("\$ 4.53",
                          style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffC67C4E))),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffC67C4E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      minimumSize: const Size(200, 56),
                    ),
                    onPressed: () {
                      // TODO: Ganti dengan navigasi kamu sendiri
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Buy Now clicked!")),
                      );
                    },
                    child: Text("Buy Now",
                        style: GoogleFonts.sora(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Widget kecil untuk icon info
  Widget _iconBox(IconData icon) => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: const Color(0xffC67C4E)),
      );
}

// 🔹 Widget Size Button
class _CoffeeSize extends StatelessWidget {
  final String title;
  final int index;
  final int selectedSize;
  final VoidCallback onClick;

  const _CoffeeSize({
    required this.title,
    required this.index,
    required this.selectedSize,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedSize == index;

    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 96,
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffC67C4E) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xffC67C4E)
                : const Color(0xffEAEAEA),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.sora(
            color: isSelected ? Colors.white : const Color(0xff2F2D2C),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
