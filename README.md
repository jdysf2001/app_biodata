# Aplikasi Biodata Mahasiswa — Tugas Pemrograman Mobile

## 📌 Deskripsi Proyek
Aplikasi Biodata Mahasiswa merupakan aplikasi mobile sederhana yang dibuat menggunakan Flutter dan bahasa pemrograman Dart untuk memenuhi tugas mata kuliah Pemrograman Mobile.

Aplikasi ini menggunakan konsep navigasi menu (*App Drawer*) dan menampilkan informasi mahasiswa, daftar nilai mata kuliah, serta profil pengguna. Aplikasi dirancang dengan antarmuka yang sederhana, rapi, dan mudah digunakan.

## 👨‍🎓 Identitas Mahasiswa
- **Nama:** Mohammad Jadid
- **NIM:** 20240801304
- **Program Studi:** Teknik Informatika
- **Perguruan Tinggi:** Universitas Esa Unggul
- **Mata Kuliah:** Pemrograman Mobile

## 🛠️ Teknologi yang Digunakan
- **Flutter** — Framework untuk membangun aplikasi mobile.
- **Dart** — Bahasa pemrograman yang digunakan dalam pengembangan aplikasi.
- **Material Design** — Komponen antarmuka pengguna untuk membangun tampilan aplikasi.
- **Android Studio** — IDE yang digunakan untuk menulis, menjalankan, dan menguji aplikasi.

## ✨ Fitur Aplikasi

### 1. Biodata Mahasiswa
Menampilkan informasi mahasiswa yang dibagi menjadi beberapa bagian:
- **Data Pribadi:** Nama, NIM, tempat dan tanggal lahir, jenis kelamin, alamat, nomor telepon, dan email.
- **Data Pendidikan:** Jenjang pendidikan, perguruan tinggi, fakultas, program studi, tahun masuk, dan status kelulusan.
- **Data Pekerjaan:** Status pekerjaan, nama perusahaan, jabatan, tahun mulai bekerja, dan deskripsi pekerjaan.
- **Organisasi:** Nama organisasi, jabatan, tahun bergabung, serta deskripsi kegiatan organisasi.

### 2. Form Nilai Mahasiswa
Menampilkan daftar mata kuliah beserta nilai mahasiswa menggunakan komponen `ListView.separated`. Data nilai disajikan dalam bentuk daftar dengan nomor urut, nama mata kuliah, dan nilai numerik.

Mata kuliah yang ditampilkan meliputi Pemrograman Mobile, Basis Data, Rekayasa Perangkat Lunak, Jaringan Komputer, Struktur Data, Pemrograman Web, Sistem Operasi, dan Kecerdasan Buatan.

### 3. Profil Pengguna
Menampilkan foto profil, nama, email, dan beberapa pilihan menu, yaitu:
- Biodata Saya.
- Pengaturan Akun.
- Keamanan.
- Tentang Aplikasi.

### 4. Navigasi App Drawer
Menyediakan menu navigasi samping untuk berpindah antara halaman Biodata Mahasiswa, Form Nilai Mahasiswa, dan Profil Pengguna. Aplikasi juga dilengkapi dengan dialog konfirmasi ketika pengguna memilih menu Keluar.

## 📂 Struktur Proyek
```text
app_biodata/
├── android/
├── assets/
│   └── foto.png
├── lib/
│   └── main.dart
├── test/
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

**Keterangan:**
- `lib/main.dart` — Berisi kode utama aplikasi, halaman biodata, daftar nilai, profil pengguna, dan navigasi.
- `assets/foto.png` — File foto profil yang digunakan pada aplikasi.
- `pubspec.yaml` — Berisi konfigurasi proyek, dependensi, dan deklarasi aset.
- `android/` — Berisi konfigurasi proyek untuk platform Android.
- `test/` — Direktori untuk pengujian aplikasi.

## 🚀 Cara Menjalankan Aplikasi
1. Pastikan Flutter SDK dan Android Studio sudah terpasang.
2. Clone atau unduh repository proyek ini.
3. Buka folder proyek menggunakan Android Studio.
4. Pastikan file foto profil tersedia di folder `assets/` dan sudah didaftarkan di `pubspec.yaml`.
5. Buka terminal pada direktori proyek, kemudian jalankan perintah berikut:

   ```bash
   flutter pub get
   ```

6. Hubungkan perangkat Android atau jalankan emulator.
7. Jalankan aplikasi dengan perintah:

   ```bash
   flutter run
   ```


Contoh konfigurasi:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/foto.png
```

## 🌐 Repository GitHub


---
Dibuat untuk memenuhi tugas mata kuliah Pemrograman Mobile — Universitas Esa Unggul.
