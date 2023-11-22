import 'package:flutter/material.dart';
import 'package:shoptheflop/screens/list_item.dart';
import 'package:shoptheflop/screens/login.dart';
import '../screens/menu.dart';
import '../screens/shoplist_form.dart';
import '../screens/shoplist_items.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          const DrawerHeader(
            // Drawer header
            decoration: BoxDecoration(
              color: Color.fromRGBO(66, 66, 66, 1),
            ),
            child: Column(
              children: [
                Text(
                  'Vending Machine',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                    "Welcome back to Vending Machine Inventory App!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          // Bagian routing
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Halaman Utama',
              style: TextStyle(color: Colors.white),
            ),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.checklist,
              color: Colors.white,
            ),
            title: const Text(
              'Lihat Item (Tugas 8)',
              style: TextStyle(color: Colors.white),
            ),
            // Bagian redirection ke ShopListPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopListPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.checklist,
              color: Colors.white,
            ),
            title: const Text(
              'Daftar Item',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            title: const Text(
              'Tambah Item',
              style: TextStyle(color: Colors.white),
            ),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}