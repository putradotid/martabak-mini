import 'package:flutter/material.dart';
import 'about_page.dart'; // pastikan file ini ada di folder yang sama atau sesuaikan path-nya

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Header profil
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile/budi.jpg'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Apriliyanto",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),
                  Text(
                    "aprildwi@gmail.com",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.orange),
                    label: const Text("Edit Profil"),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.orange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      foregroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Menu pengaturan
            _buildMenuItem(Icons.settings, "Pengaturan Akun"),
            _buildMenuItem(Icons.help_outline, "Bantuan"),
            _buildMenuItem(Icons.info_outline, "About", onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            }),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // 🔸 Widget item menu
  Widget _buildMenuItem(IconData icon, String title, {VoidCallback? onTap, Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.orange),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}
