
class Item {
  Item(
      {required this.name,
      required this.price,
      required this.amount,
      required this.description,
      this.id});

  static List<Item> list = [];
  int? id;
  String name;
  int price;
  int amount;
  String description;

  @override
  String toString() {
    String output = "";
    output += "$id. $name\n";
    output += "Harga: $price\n";
    output += "Jumlah: $amount\n";
    output += "Deskripsi: $description\n";
    return output;
  }
}