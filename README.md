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
- Column, Ini adalah widget yang mengatur konten secara vertikal, sehingga dapat menambahkan children widget di dalamnya.
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

# TUGAS 8
## 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Metode Navigator.push() dan Navigator.pushReplacement() adalah metode navigasi pada Flutter yang digunakan untuk menambahkan halaman baru ke dalam tumpukan halaman (stack) dan menampilkan halaman tersebut. Perbedaan antara keduanya adalah:
Navigator.push() menambahkan halaman baru ke dalam tumpukan halaman dan menampilkan halaman tersebut di atas halaman saat ini. Ketika pengguna menekan tombol kembali, maka halaman saat ini akan dihapus dari tumpukan halaman dan kembali ke halaman sebelumnya. Contoh penggunaan metode ini adalah ketika pengguna menekan tombol "Tambahkan" pada halaman daftar item, maka halaman detail item akan ditambahkan ke dalam tumpukan halaman dan ditampilkan di atas halaman daftar item.
Navigator.pushReplacement() menambahkan halaman baru ke dalam tumpukan halaman dan menghapus halaman saat ini dari tumpukan halaman. Halaman baru kemudian akan ditampilkan di atas halaman sebelumnya. Ketika pengguna menekan tombol kembali, maka halaman sebelumnya akan ditampilkan. Contoh penggunaan metode ini adalah ketika pengguna menekan tombol "Simpan" pada halaman edit item, maka halaman detail item akan ditambahkan ke dalam tumpukan halaman dan halaman edit item akan dihapus dari tumpukan halaman.

## 2.  Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Dalam Flutter, ada berbagai layout widget yang dapat digunakan untuk mengelola posisi dan ukuran widget-widget dalam halaman. Berikut adalah beberapa layout widget yang paling umum digunakan dan konteks penggunaannya masing-masing:
### 1. Row: Menyusunkan widget-widget horizontal. Row akan membuat widget-widget yang disertakan secara horizontal dalam satu baris
```dart
Row(
  children: <Widget>[
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
### 2. Column: Menyusunkan widget-widget vertikal. Column akan membuat widget-widget yang disertakan secara vertikal, satu di atas yang lain
```dart
Column(
  children: <Widget>[
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
### 3. ListView: Menampilkan daftar widget-widget yang dapat berisi berbagai jumlah widget. ListView akan membuat widget-widget yang disertakan secara vertikal, dari atas ke bawah
```dart
ListView(
  children: <Widget>[
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
### 4. GridView: Menampilkan daftar widget-widget yang dapat berisi berbagai jumlah widget. GridView akan membuat widget-widget yang disertakan secara rantai, dari kiri ke kanan dan dari atas ke bawah
```dart
GridView(
  children: <Widget>[
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
### 5. Stack: Menyusunkan widget-widget yang dapat berisi berbagai jumlah widget. Stack akan membuat widget-widget yang disertakan satu di atas yang lain, dengan widget yang terletak paling bawah hanya terlihat jika ada widget yang terletak pada posisi yang sama
```dart
Stack(
  children: <Widget>[
    Text('Widget 1'),
    Positioned(
      left: 10,
      top: 10,
      child: Text('Widget 2'),
    ),
    Positioned(
      right: 10,
      bottom: 10,
      child: Text('Widget 3'),
    ),
  ],
)
```
### 6. Scaffold: Widget utama untuk menyediakan struktur dasar dari aplikasi Flutter. Scaffold menyediakan app bar, body, dan drawer serta tombol tindakan standar
```dart
Scaffold(
  appBar: AppBar(title: Text('Judul')),
  body: Center(child: Text('Isi Halaman')),
  drawer: Drawer(child: Text('Menu')),
)
```
Dalam setiap contoh, children adalah properti yang menerima daftar widget yang akan menjadi anak-anak dari widget-widget yang diwakili oleh layout widget tersebut. Maka dari itu, user dapat menambahkan widget-widget yang berbeda untuk menciptakan tata letak yang ingin dicapai.

## 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
### 1. TextFormField pada "Nama Produk"
Elemen ini digunakan untuk memungkinkan pengguna memasukkan nama produk. Ini adalah field teks dasar yang validasinya memastikan bahwa nama produk tidak boleh kosong. 

### 2.TextFormField untuk "Jumlah Produk"
Elemen ini memungkinkan pengguna memasukkan jumlah produk dalam bentuk angka. Validator pada field ini memastikan bahwa input tidak kosong dan merupakan angka. Penggunaan TextFormField untuk jumlah adalah penting karena menyediakan cara yang tepat untuk menginputkan dan memvalidasi data numerik.

### 3. TextFormField untuk "Deskripsi"
Ini digunakan untuk memasukkan deskripsi produk. Field ini memberikan ruang bagi pengguna untuk memberikan detail tambahan mengenai produk. Validator memastikan bahwa deskripsi tidak kosong.

### 4. ElevatedButton untuk "Save"
Diguuntuk efek peninggian dan memberikan respon ketika diklik. Button ini juga akan menyimpan item yang nantinya akan masuk ke list item.

## 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture pada aplikasi Flutter dapat dilakukan dengan memisahkan kode menjadi tiga lapisan utama, yaitu:
- Lapisan Presentasi: Lapisan ini berisi kode-kode yang berhubungan dengan tampilan aplikasi, seperti widget-widget, layout, dan animasi. Lapisan ini bertanggung jawab untuk menampilkan data dari lapisan domain ke pengguna.
- Lapisan Domain: Lapisan ini berisi kode-kode yang berhubungan dengan bisnis logika aplikasi, seperti model, use case, dan repository. Lapisan ini bertanggung jawab untuk memproses data dan mengambil data dari sumber eksternal.
- Lapisan Sumber Eksternal: Lapisan ini berisi kode-kode yang berhubungan dengan sumber data eksternal, seperti database, API, dan file. Lapisan ini bertanggung jawab untuk mengambil dan menyimpan data dari dan ke sumber eksternal.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
- Pertama-tama membuat halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan
Membuat file shoplist_form.dart untuk mengisi data Item (name, price, amount, dan description). ShopFormPage() akan extends StatefulWidget() karena dapat memberikan respon pop-up dan send error message
    - Lalu, memakai atribut yang masing-masingnya dibungkus dalam widget Padding() berbeda dan setiap elemen input menggunakan widget TextFormField():

    ```dart
    String _name = "";
    int _amount = 0;
    String _description = "";
    ```

    - Untuk membuat tombol save, maka akan menggunakan widget berupa ElevatedButton() yang di dalam widget Align() dan menggunakan onPressed() untuk handle ketika button diklik. Apabila input sudah sesuai ketentuan ketika user klik button Save, maka akan ada pop-up konten yang menampilkan detail dari instance Item yang baru saja diinput
    - Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
    Menggunakan validator: (String? value) {...} di setiap TextFormField(). Apabila input tidak sesuai, akan diminta input ulang (input tidak disave) dan field menjadi warna merah
        - Setiap elemen input tidak boleh kosong.
        if (value == null || value.isEmpty) untuk memastikan input tidak null atau input tidak kosong
        - Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
        Apabila int: if (int.tryParse(value) == null) untuk memastikan parse berhasil (jika gagal, maka int.tryParse(value) bernilai null). Apabila String: tidak handle parse, cukup memastikan tidak kosong atau tidak null seperti di atas
 - Lalu untuk mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama memakai Navigator.push() agar tetap bisa kembali ke page sebelumnya. Navigator.push() ditambahkan di left_drawer.dart dan button Tambah Item di file menu.dart. Navigator.push() akan mengarahkan ke ShopFormPage() pada file shoplist_form.dart untuk menjalankan build, berikut contoh kodenya:
 ```dart
 if (item.name == "Tambah Item") {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ShopFormPage(),
        ));
 }
 ```
 - Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
 Menggunakan onPressed() function kemudian validasi input. Jika input sesuai, maka akan muncul pop-up message menggunakan showDialog() dan AlertDialog(). Tampilkan pesan "Item Berhasil Tersimpan" beserta detail atribut item tersebut (name, price, amount, description, dan dateAdded) menggunakan widget Text
 - Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
 Membuat file left_drawer.dart untuk menampilkan drawer
    - Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
    Menambahkan widget ListTitle() untuk setiap opsi, Terdapat 3 opsi, Halaman Utama, Tambah Item, dan Lihat Item
    - Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
    Memanfaatkan Navigator.pushReplacement() karena tidak perlu kembali ke page sebelumnya (ingin ke home). Navigator.push() ditambahkan di left_drawer.dart sebagai suatu ListTile(). Navigator.push() akan mengarahkan ke MyHomePage() pada file menu.dart untuk menjalankan build
    - Ketika memiih opsi Tambah Item, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
    Memanfaatkan Navigator.push() agar tetap bisa kembali ke page sebelumnya. Navigator.push() ditambahkan di left_drawer.dart sebagai suatu ListTile(). Navigator.push() akan mengarahkan ke ShopFormPage() pada file shoplist_form.dart untuk menjalankan build
- Untuk membuat sebuah halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data produk yang sudah pernah dibuat, pertama-tama membuat file shoplist_items.dart yang akan menampilkan seluruh Item. Iterasi setiap instance Item() yang ada di item.dart, dapat diakses melalui static attribut Item.list
Tampilkan setiap instance Item() dalam bentuk semacam card, implementasinya ada di file item_card.dart yang akan menampilkan detail attribute suatu item
- Lalu, untuk mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Item pada halaman utama atau drawer, digunakanlah Navigator.push() agar tetap bisa kembali ke page sebelumnya. Navigator.push() ditambahkan di left_drawer.dart dan button Lihat Item di file menu.dart. Navigator.push() akan mengarahkan ke ShopListPage() pada file shoplist_page.dart untuk menjalankan build

# TUGAS 9

## 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun, apakah hal tersebut lebih baik daripada membuat model tergantung pada kasus penggunaan spesifiknya. Jika data JSON sederhana dan hanya memiliki beberapa field, mungkin lebih efisien untuk mengambil data tanpa membuat model. Namun, jika data JSON kompleks dan memiliki banyak field, mungkin lebih bermanfaat untuk membuat model untuk lebih baik mengatur dan mengelola data.

## 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah sebuah instance yang digunakan untuk mengambil data cookie dari permintaan HTTP. Instance ini perlu dibagikan ke semua komponen di aplikasi Flutter karena cookie dapat digunakan untuk menyimpan informasi pengguna seperti preferensi, riwayat login, dan lain-lain. Dengan membagikan instance CookieRequest ke semua komponen, maka informasi pengguna dapat diakses dan digunakan di seluruh aplikasi. Hal ini dapat membantu meningkatkan pengalaman pengguna dan memudahkan pengelolaan data pengguna di aplikasi.

## 3.  Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Untuk mengambil data dari JSON dan menampilkannya pada Flutter, ada beberapa langkah yang perlu diikuti. Pertama, buat proyek Flutter baru. Selanjutnya, buat halaman utama yang akan menampilkan data dari API yang Anda dapatkan. Kemudian, akses API menggunakan package http untuk mengambil data dari JSON. Setelah itu, gunakan ListView.builder untuk menampilkan data tersebut. Selain itu, perlu dibuat model yang sesuai dengan struktur data JSON dan mengonversi data JSON menjadi objek model menggunakan metode fromJson.

## 4.  Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Untuk melakukan autentikasi dari input data akun pada Flutter ke Django, dan menampilkan menu pada Flutter setelah proses autentikasi selesai, Berikut langkah-langkahnya :

### 1. Autentikasi dari Input Data Akun pada Flutter ke Django:
- Pengguna memasukkan data akun pada aplikasi Flutter.
- Data akun tersebut dikirim ke server Django melalui permintaan HTTP, misalnya dengan menggunakan package http pada Flutter.
- Di sisi server Django, Anda dapat menggunakan Django REST framework untuk menangani permintaan autentikasi dan memeriksa kecocokan data akun yang diterima.
- Jika autentikasi berhasil, server Django dapat mengirimkan respons ke Flutter untuk memberitahu bahwa autentikasi berhasil dilakukan.
### 2. Tampilan Menu pada Flutter Setelah Proses Autentikasi:
- Setelah autentikasi berhasil, Flutter dapat menampilkan menu atau halaman berikutnya, - misalnya dengan menggunakan Navigator untuk berpindah antar halaman.
- Menu atau halaman yang ditampilkan dapat disesuaikan berdasarkan hasil autentikasi, misalnya menampilkan menu khusus untuk pengguna yang berhasil login.

## 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- AppBar: Mirip dengan Navbar, terletak di bagian atas aplikasi.
- Container: Komponen yang mengemas beberapa widget lain, dengan kemampuan untuk menyesuaikan background, margin, padding, dan lainnya.
- Center: Digunakan untuk menempatkan widget di tengah.
- Scaffold: Membentuk kerangka dasar untuk aplikasi Flutter dengan desain material.
- Column: Mengatur anak-anak widget dalam satu kolom secara vertikal, ideal untuk penataan layout dalam satu kolom.
- Material: Memberikan tampilan visual dan interaksi untuk aplikasi Flutter.
- Text: Menampilkan teks di halaman.
- Padding: Mengelola jarak atau ruang di sekitar widget anak.
- TextStyle: Kustomisasi teks termasuk warna, ukuran, dan lainnya.
- ElevatedButton: Tombol dengan efek peninggian yang responsif ketika diklik.
- ButtonStyle: Menentukan gaya tombol.
- ListView: Mengatur anak-anak widget dalam daftar, berguna untuk menampilkan list item.
- InputDecoration: Mengatur dekorasi pada elemen input termasuk label, ikon, dan gaya teks.
- TextField: Membuat bidang input teks yang dapat diubah oleh pengguna.

## 6.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
- Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
-  Membuat halaman login pada proyek tugas Flutter.
membuat file login.dart dan menjadikan login sebagai halaman pertama yang muncul
- Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
install django-cors-headers, lalu membuat app authentication pada django dan menambahkan urls.py dan views.py pada app authentication
-  Membuat model kustom sesuai dengan proyek aplikasi Django.
membuat file item.dart yang menyimpan model dengan menggunakan quicktype
- Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
gunakan AsyncSnapshot snapshot untuk iterasi setiap item.
-  Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
membuat elevated buttons untuk redirect ke detail page yang diinginkan. Menggunakan model item. Membuat elevated button dengan tulisan back untuk kembali ke page list item

