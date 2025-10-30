import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Column(
            children: [
              // 🧾 Produk dalam keranjang
              Container(
                width: 315,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            "assets/icons-kompres.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cappuccino",
                              style: GoogleFonts.sora(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff2F2D2C),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "with Chocolate",
                              style: GoogleFonts.sora(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff9B9B9B),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        _circleButton("-", const Color(0xffAAADB0)),
                        const SizedBox(width: 15),
                        Text(
                          "1",
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 15),
                        _circleButton("+", const Color(0xffAAADB0)),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Container(height: 4, decoration: const BoxDecoration(color: Color(0xffF4F4F4))),
              const SizedBox(height: 20),

              // 🎟️ Diskon
              Container(
                width: 315,
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xffEAEAEA)),
                ),
              ),
              const SizedBox(height: 20),

              // 💰 Ringkasan Pembayaran
              SizedBox(
                width: 315,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Summary",
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 13),

                    _buildPaymentRow("Price", "\$ 4.53", isBold: true),
                    const SizedBox(height: 7),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Fee",
                          style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            Text(
                              "\$ 2.0",
                              style: GoogleFonts.sora(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "\$ 1.0",
                              style: GoogleFonts.sora(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 7),
                    _buildPaymentRow("Total Payment", "\$ 5.53", isBold: true),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🪙 Bagian bawah: Metode pembayaran + tombol Order
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 6,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 315,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.attach_money, color: Color(0xffC67C4E), size: 24),
                              const SizedBox(width: 10),
                              Container(
                                width: 112,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 51,
                                      height: 24,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffC67C4E),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Cash",
                                        style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "\$ 5.53",
                                      style: GoogleFonts.sora(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: const Color(0xff808080),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(Icons.more_horiz, size: 19.2, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tombol Order
                    SizedBox(
                      width: 315,
                      height: 62,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffC67C4E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Order placed!')),
                          );
                        },
                        child: Text(
                          'Order',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Widget tambahan untuk menghindari duplikasi
  Widget _buildPaymentRow(String title, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _circleButton(String text, Color color) {
    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xffEAEAEA)),
      ),
      child: Text(
        text,
        style: GoogleFonts.sora(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
