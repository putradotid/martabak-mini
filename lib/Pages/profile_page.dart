import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [CircleAvatar(radius: 50, backgroundImage: NetworkImage(""),),
                SizedBox(width: 12, height: 12,),
                Text("Apriliyanto",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.orange[800]),),
                Text("aprildwi@gmail.com",style: TextStyle(color: Colors.grey[700]),),
                SizedBox(height: 12),
                OutlinedButton.icon(onPressed: (){},
                icon: Icon(Icons.edit,color: Colors.orange,), 
                label: Text("Edit Profil "),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  foregroundColor: Colors.orange
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        _buildMenuItem(Icons.receipt_long, "Riwayat Pesanan"),
        _buildMenuItem(Icons.settings, "Pengaturan Akun"),
        _buildMenuItem(Icons.help_outline, "Bantuan"),
        _builMenuLogoutItem(context),
        SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  Widget _buildMenuItem(IconData icon, String title, {Color? iconColor}) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.orange),
      title: Text(title, style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(Icons.chevron_right,color: Colors.grey),
      onTap: (){},
    );
  }

  Widget _builMenuLogoutItem(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: Colors.red,),
      title: Text("Keluar", style: TextStyle(fontSize: 16),),
      trailing: Icon(Icons.chevron_right,color: Colors.grey,),
      onTap: (){
        showDialog(context: context,
        builder: (context) => AlertDialog(
          title: Text("Keluar Aplikasi"),
          content: Text("Yakin ingin keluar?"),
          actions: [
            TextButton(
              child: Text("Batal"),
              onPressed: () => Navigator.of(context).pop(), 
            ),
            TextButton(
               child: Text("Keluar"),
              onPressed: () {
                Navigator.of(context).pop();
                // SystemNavigator.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}