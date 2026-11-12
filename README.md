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
