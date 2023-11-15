import 'package:shoptheflop/screens/menu.dart';
import 'package:shoptheflop/screens/shoplist_form.dart';
import 'package:flutter/material.dart';
import 'package:shoptheflop/screens/shoplist_items.dart';

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;

    // Set different background colors based on the item's name
    if (item.name == "Lihat Item") {
      backgroundColor = const Color.fromARGB(255, 127, 76, 175);
    } else if (item.name == "Tambah Item") {
      backgroundColor = const Color.fromARGB(255, 33, 79, 243);
    } else if (item.name == "Logout") {
      backgroundColor = const Color.fromARGB(255, 54, 177, 244);
    } else {
      backgroundColor = Colors.indigo;
    }

    return Material(
      color: backgroundColor,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
          } else if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopListPage(),
                ));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
