Nama : Asfara Quaneisha Syafaziel
NPM : 2506603532 
Kelas : PBP A
Prodi : Sistem Informasi

### Tugas 7
Pertanyaan Reflektif
1. Widget tree adalah struktur yang menunjukkan hubungan antar-widget dalam aplikasi Flutter. Setiap widget bisa memiliki widget lain sebagai child-nya. Widget parent bertugas mengatur atau membungkus widget child yang ada di dalamnya. Contohnya, di aplikasi ini Scaffold menjadi parent yang memiliki AppBar dan Padding sebagai child. Kemudian, Padding membungkus Column yang berisi Row, InfoCard, dan widget lainnya. Susunan ini membentuk hierarki yang menentukan bagaimana tampilan aplikasi dibuat.
2. Antara lain,
MaterialApp: Menjadi pembungkus utama aplikasi dan mengatur tema serta halaman awal.
Scaffold: Menyediakan struktur dasar halaman, seperti app bar dan body.
AppBar: Menampilkan bagian header aplikasi.
Text: Menampilkan teks.
Padding: Memberikan jarak di sekitar widget.
Column: Menyusun widget secara vertikal.
Row: Menyusun widget secara horizontal.
Center: Menempatkan child di tengah.
SizedBox: Memberikan jarak atau ukuran tertentu.
GridView.count: Menampilkan kumpulan widget dalam bentuk grid.
Card: Menampilkan informasi dalam bentuk kartu.
Container: Mengatur ukuran, padding, dan tampilan widget.
Material: Menyediakan tampilan material dengan warna dan bentuk tertentu.
InkWell: Membuat widget dapat merespons interaksi seperti tap.
Icon: Menampilkan ikon.
SnackBar: Menampilkan pesan sementara ketika tombol ditekan.
Selain itu, kita juga menggunakan MyHomePage, InfoCard, dan ItemCard sebagai custom widget untuk menyusun tampilan aplikasi agar lebih terstruktur dan mudah digunakan kembali.
3. MaterialApp berfungsi buat menyediakan konfigurasi dasar aplikasi Flutter yang menggunakan Material Design, seperti tema, navigasi, dan halaman awal. Widget ini sering digunakan sebagai root widget karena menjadi titik awal yang membungkus seluruh struktur aplikasi dan menyediakan konfigurasi yang dapat digunakan oleh widget-widget di bawahnya.
4. Kalau StatelessWidget itu tampilannya tidak bergantung pada perubahan state internal, jadi cocok digunakan untuk tampilan yang relatif tetap, seperti InfoCard dan ItemCard dalam proyek ini.. Sedangkan StatefulWidget dapat menyimpan dan mengubah state sehingga tampilannya bisa diperbarui ketika terjadi perubahan data, makanya lebih cocok digunakan ketika sebuah widget perlu mengelola perubahan data atau interaksi yang memengaruhi tampilannya.
5. BuildContext merupakan referensi terhadap posisi sebuah widget di dalam widget tree. Dengan BuildContext, sebuah widget dapat mengakses informasi dari widget lain yang berada di atasnya, seperti tema aplikasi melalui Theme.of(context) atau menampilkan SnackBar melalui ScaffoldMessenger.of(context). Oleh karena itu, BuildContext digunakan dalam metode build() untuk mengakses informasi yang dibutuhkan saat menyusun tampilan widget.
6. Hot reload itu bikin perubahan kode ditampilkan dengan cepat tanpa mengulang seluruh aplikasi, serta mempertahankan state yang sedang berjalan. Kalau hot restart menjalankan ulang aplikasi dari awal sehingga state sebelumnya akan di-reset. Full restart diperlukan ketika perubahan kode tidak dapat diterapkan hanya dengan hot reload atau hot restart, misalnya ketika ada perubahan pada konfigurasi native atau proses inisialisasi aplikasi yang perlu dijalankan ulang sepenuhnya.

AI Disclosure
Dalam pengerjaan Tugas 7, saya menggunakan ChatGPT sebagai alat bantu untuk memastikan instruksi tugas dan membantu saya memahami pertanyaan reflektif, yaitu mengidentifikasi widgets, memahami BuildContext, dan membedakan hot reload dan hot restart.

### Tugas 8
1. Navigator.push() digunakan untuk membuka halaman baru tanpa menghapus halaman sebelumnya dari navigation stack. Navigator.pushReplacement() digunakan untuk membuka halaman baru sekaligus menggantikan halaman sebelumnya, sedangkan Navigator.pop() digunakan untuk kembali ke halaman sebelumnya. Pada aplikasi ini, kartu Add Volunteering menggunakan Navigator.push() untuk membuka formulir baru. Sementara itu, opsi Home pada drawer menggunakan Navigator.pushReplacement() agar pengguna dapat kembali ke halaman utama.
2. Scaffold menyediakan struktur dasar halaman, seperti area konten, AppBar, dan Drawer. AppBar digunakan sebagai bagian atas halaman untuk menampilkan judul, sedangkan Drawer menyediakan navigasi yang konsisten di beberapa halaman. Contohnya, halaman utama dan halaman formulir Volunteering sama-sama menggunakan warna pink pada AppBar dan Drawer biar tampilan aplikasi tetep seragam.
3. Form menggunakan SingleChildScrollView agar pengguna dapat meng-scroll halaman ketika seluruh input tidak muat dalam layar, terutama saat keyboard muncul. Padding dan SizedBox digunakan untuk memberikan jarak antarinput sehingga formulir lebih rapi dan mudah dibaca. Dengan susunan ini, tombol Simpan tetap dapat dijangkau meskipun ruang layar terbatas.
4. GlobalKey<FormState> digunakan untuk mengakses dan mengelola state dari Form. Setiap input memiliki validator untuk memeriksa apakah nilai yang dimasukkan sudah sesuai, sedangkan validate() menjalankan seluruh validator ketika tombol Simpan ditekan. Contohnya, nama kegiatan yang hanya berisi spasi akan ditolak karena setelah menggunakan trim(), nilainya menjadi kosong. Pemilihan jenis input atau keyboard saja belum cukup karena hal tersebut tidak menjamin bahwa nilai yang dimasukkan benar-benar valid. Oleh karena itu, validasi tetap diperlukan.

AI Disclosure
Dalam pengerjaan Tugas 8, saya menggunakan ChatGPT untuk membantu memahami instruksi tugas, menjelaskan penggunaan navigasi Flutter (Navigator.push() dan Navigator.pushReplacement()), serta membantu implementasi formulir Volunteering, validasi input, date picker, dan dialog ringkasan. ChatGPT juga membantu memperbaiki warning saat menjalankan flutter analyze.