# shoptheflop

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# TUGAS 7
##  Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Stateless dan Stateful Widget adalah dua jenis widget yang umum digunakan dalam pengembangan aplikasi Flutter. Berikut adalah perbedaan utama antara Stateless dan Stateful Widget

### Stateless Widget:
- Widget yang di-build hanya dengan konfigurasi yang telah diinisiasi sejak awal.
- Widget yang tidak akan pernah berubah.
- Digunakan untuk membuat tampilan statis yang tidak memerlukan perubahan dinamis.
- Tidak memiliki state internal yang dapat berubah seiring waktu.
- Tidak dapat menggunakan fungsi setState().
### Stateful Widget:
- Widget yang dapat berubah dinamis.
- Digunakan untuk membuat tampilan yang memerlukan perubahan dinamis, seperti ketika ada interaksi pengguna atau perubahan data.
- Memiliki state internal yang dapat berubah seiring waktu.
- Dapat menggunakan fungsi setState() untuk memberitahu framework bahwa ada object yang berubah pada State, kemudian akan melakukan build ulang pada Widget tersebut.

Dalam pengembangan aplikasi Flutter, Stateless Widget lebih cocok digunakan untuk membuat tampilan statis yang tidak memerlukan perubahan dinamis, sedangkan Stateful Widget lebih cocok digunakan untuk membuat tampilan yang memerlukan perubahan dinamis. Namun, keduanya dapat digunakan secara bersamaan untuk membuat tampilan yang lebih kompleks.

##  Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- MyHomePage, Ini adalah widget utama yang mewakili halaman utama aplikasi. MyHomePage mengatur tampilan keseluruhan halaman termasuk AppBar dan body.
Pada bagian body, digunakan SingleChildScrollView untuk mengizinkan konten discroll dan Column untuk mengatur kontennya secara vertikal.
- Scaffold, Ini adalah widget yang digunakan untuk membuat kerangka dasar aplikasi. Widget ini mengandung komponen seperti AppBar dan body.
- AppBar, Appbar adalah widget yang digunakan untuk membuat AppBar di bagian atas halaman. Widget ini untuk menentukan judul dan warna latar belakang (backgroundColor) serta warna teks (foregroundColor).
SingleChildScrollView, Ini adalah widget yang memungkinkan konten di dalamnya dapat discroll. Digunakan untuk menghindari kesalahan overflow ketika kontennya terlalu panjang.
- Padding, Padding digunakan untuk memberikan padding (jarak) dari semua sisi untuk mengatur jarak antara elemen-elemen di dalamnya.
- Column, Ini adalah widget yang mengatur konten secara vertikal, sehingga Anda dapat menambahkan children widget di dalamnya.
- GridView.count, Ini adalah widget yang digunakan untuk membuat grid dengan jumlah kolom yang tetap. Dapat digunakan untuk mengatur jumlah kolom (crossAxisCount), jarak antara kolom (crossAxisSpacing), dan jarak antara baris (mainAxisSpacing) serta mengisi kontennya dengan daftar item.
- ShopCard, Ini adalah widget yang mewakili kartu untuk setiap item dalam shopping list. Shopcard mengambil objek ShopItem sebagai parameter dan menampilkan ikon dan teks item.
- InkWell, Widget ini digunakan untuk membuat area yang responsif terhadap sentuhan dan menampilkan snackbar ketika card ditekan.
- Icon: Icon digunakan untuk menampilkan ikon yang sesuai dengan item di dalam kartu.
- Text: Text digunakan untuk menampilkan teks (nama item) di dalam kartu.
ShopItem: ShopItem adalah kelas yang mewakili item dalam shopping list. ShopItem memiliki dua atribut: name untuk nama item dan icon untuk ikon item.
- items: items adalah daftar item dalam shopping list yang dibuat sebagai instance dari ShopItem

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- Untuk menjalankan membuat sebuah program flutter pertama-tama buat dulu projek flutter dulu dengan menulis kode ini di terminal
    ```bash
    flutter create shoptheflop
    cd shoptheflop
    flutter run
    ```
- Lalu untuk mengubah membuat tiga simbol maka perlu diubah main.dart menjadi seperti di bawah ini agar home page berada di menu.dart
    ```dart
    import 'package:flutter/material.dart';
    import 'package:shoptheflop/menu.dart';

    void main() {
        runApp(const MyApp());
    }

    class MyApp extends StatelessWidget {
        const MyApp({super.key});

        // This widget is the root of your application.
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Vending Machine',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54),
                useMaterial3: true,
            ),
            home: MyHomePage(),
            );
        }
    }
    ```
    - Perlu juga ditambahkan class ShopItem sebagai berikut pada menu.dart
    ```dart
    class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
    }
    ```
    - Melihat daftar item (Lihat Item)
        - Menambahkan `  ShopItem("Lihat Produk", Icons.checklist),` sebagai tombol Lihat Item pada final List<ShopItem> items <br>
    - Menambah item (Tambah Item)
        - Menambahkan `ShopItem("Tambah Produk", Icons.add_shopping_cart),` sebagai tombol Tambah Item pada final List<ShopItem> items <br>
    - Logout (Logout)
        - Menambahkan `ShopItem("Logout", Icons.logout),` sebagai tombol Logout pada final List<ShopItem> items <br>
        
    - Untuk membuat class ShopCard yang akan menjadi StatelessWidget untuk ShopItem, maka Pada MyHomePage, ubah `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`

- Untuk memunculkan snackbar dengan tulisan yang sudah ditentukan, perlu ditambahkan potongan kode berikut pada function build ShopCard agar muncul SnackBar sebagai respon ketika button diklik. Tidak perlu membuat sebanyak 3 karena hanya perlu disesuaikan dengan attribute `name` dari masing-masing ShopItem.
    ```dart
    onTap: () {
        // Memunculkan SnackBar ketika diklik
        ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));
    },
    ```
- Untuk menyelesaikan bonus, perlu ditambahkan kode ini pada
    ```dart
    Color backgroundColor;

    // Set different background colors based on the item's name
    if (item.name == "Lihat Produk") {
      backgroundColor = const Color.fromARGB(255, 127, 76, 175);
    } else if (item.name == "Tambah Produk") {
      backgroundColor = const Color.fromARGB(255, 33, 79, 243);
    } else if (item.name == "Logout") {
      backgroundColor = const Color.fromARGB(255, 54, 177, 244);
    } else {
      backgroundColor = Colors.indigo;
    }
    ```

<hr>

</details>
