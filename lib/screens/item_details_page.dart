import 'package:flutter/material.dart';
import 'package:shoptheflop/widgets/left_drawer.dart';
import '../model/item.dart';

class ItemDetailsPage extends StatelessWidget {
  final Item item;

  const ItemDetailsPage(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.grey.shade800,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Material(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Text(
                  item.fields.name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(5)),
                Text(
                  'Harga: ${item.fields.price}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  'Jumlah: ${item.fields.amount}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.fields.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade700),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
