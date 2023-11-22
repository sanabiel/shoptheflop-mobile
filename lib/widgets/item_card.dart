import 'package:flutter/material.dart';
import '../model/item1.dart';

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(40),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Harga: ${item.price}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Jumlah: ${item.amount}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  item.description,
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