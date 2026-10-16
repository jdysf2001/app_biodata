import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

const biru = Color(0xFF1976F2);
const bgAbu = Color(0xFFF7F9FC);
const namaUser = 'Mohammad Jadid';
const emailUser = 'jadid.yusuf01@gmail.com';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Tugas Pemrograman Mobile',
    theme: ThemeData(
      useMaterial3: false,
      primaryColor: biru,
      scaffoldBackgroundColor: bgAbu,
      appBarTheme: const AppBarTheme(
        backgroundColor: biru,
        foregroundColor: Colors.white,
        elevation: 2,
        titleTextStyle: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
    home: const BiodataPage(),
  );
}

// ---------- Avatar (ganti dengan Image.assets jika punya foto) ----------
class Avatar extends StatelessWidget {
  final double radius;
  const Avatar({super.key, this.radius = 30});

  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius,
    backgroundColor: const Color(0xFFE3EEFD),
    backgroundImage: const AssetImage('assets/foto.png'),
  );
}

// ---------- Drawer ----------
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Widget _item(BuildContext c, IconData icon, String text, VoidCallback onTap) =>
      ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(text, style: const TextStyle(fontSize: 14)),
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          width: double.infinity,
          color: biru,
          padding: EdgeInsets.fromLTRB(
              16, MediaQuery.of(context).padding.top + 16, 16, 20),
          child: const Row(children: [
            Avatar(radius: 30),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tugas Pemrograman Mobile',
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(height: 4),
                    Text('Selamat Datang',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
          ]),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Menu Utama',
                  style: TextStyle(fontWeight: FontWeight.w600))),
        ),
        _item(context, Icons.person, '1. BIODATA MAHASISWA',
                () => Navigator.pop(context)),
        _item(context, Icons.fact_check_outlined, '2. FORM NILAI MAHASISWA', () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const NilaiPage()));
        }),
        _item(context, Icons.account_circle, '3. PROFILE PENGGUNA', () {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ProfilPage()));
        }),
        const Divider(indent: 16, endIndent: 16, height: 32),
        _item(context, Icons.logout, 'Keluar', () {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Keluar'),
              content: const Text('Yakin ingin keluar dari aplikasi?'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal')),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: const Text('Keluar')),
              ],
            ),
          );
        }),
      ]),
    );
  }
}

// ---------- 1. Biodata Mahasiswa ----------
class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  void _go(BuildContext c, Widget page) =>
      Navigator.push(c, MaterialPageRoute(builder: (_) => page));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1. BIODATA MAHASISWA')),
      drawer: const AppDrawer(),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        MenuCard(
          icon: Icons.person,
          iconColor: const Color(0xFF1976F2),
          bg: const Color(0xFFD6E6FB),
          title: 'Data Pribadi',
          subtitle: 'Informasi diri mahasiswa',
          onTap: () => _go(context, const DataPribadiPage()),
        ),
        MenuCard(
          icon: Icons.school,
          iconColor: const Color(0xFF5B3FBF),
          bg: const Color(0xFFE6DDF9),
          title: 'Data Pendidikan',
          subtitle: 'Riwayat pendidikan',
          onTap: () => _go(context, const DataPendidikanPage()),
        ),
        MenuCard(
          icon: Icons.work,
          iconColor: const Color(0xFF1E9E4A),
          bg: const Color(0xFFD3F3DD),
          title: 'Data Pekerjaan',
          subtitle: 'Pengalaman pekerjaan',
          onTap: () => _go(context, const DataPekerjaanPage()),
        ),
        MenuCard(
          icon: Icons.groups,
          iconColor: const Color(0xFFE08A00),
          bg: const Color(0xFFFFEBC2),
          title: 'Organisasi',
          subtitle: 'Organisasi yang diikuti',
          onTap: () => _go(context, const OrganisasiPage()),
        ),
      ]),
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor, bg;
  final String title, subtitle;
  final VoidCallback onTap;
  const MenuCard(
      {super.key,
        required this.icon,
        required this.iconColor,
        required this.bg,
        required this.title,
        required this.subtitle,
        required this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 14),
    elevation: 1.5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(children: [
          CircleAvatar(
              radius: 26,
              backgroundColor: bg,
              child: Icon(icon, color: iconColor, size: 28)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 3),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 12, color: Colors.black54)),
                ]),
          ),
          const Icon(Icons.chevron_right, color: Colors.black54),
        ]),
      ),
    ),
  );
}

// ---------- 2. Form Nilai ----------
class NilaiPage extends StatelessWidget {
  const NilaiPage({super.key});

  // Data nilai contoh (silakan ganti dengan nilai asli Anda)
  static const data = [
    ['Pemrograman Mobile', 90],
    ['Basis Data', 88],
    ['Rekayasa Perangkat Lunak', 85],
    ['Jaringan Komputer', 82],
    ['Struktur Data', 87],
    ['Pemrograman Web', 89],
    ['Sistem Operasi', 80],
    ['Kecerdasan Buatan', 86],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2. FORM NILAI MAHASISWA')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                color: const Color(0xFFEDEFF3),
                borderRadius: BorderRadius.circular(8)),
            child: const Row(children: [
              SizedBox(
                  width: 32,
                  child: Text('No',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Mata Kuliah',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Text('Nilai', style: TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: data.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: Row(children: [
                  SizedBox(width: 32, child: Text('${i + 1}')),
                  Expanded(child: Text(data[i][0] as String)),
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: const Color(0xFFDCEBFD),
                        borderRadius: BorderRadius.circular(6)),
                    child: Text('${data[i][1]}',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// ---------- 3. Profil Pengguna ----------
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  Widget _row(IconData icon, String text, [VoidCallback? onTap]) => Container(
    margin: const EdgeInsets.only(bottom: 8),
    color: Colors.white,
    child: ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(text, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3. PORFILE PENGGUNA')),
      body: Column(children: [
        Container(
          width: double.infinity,
          color: const Color(0xFFBBD6F5),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: const Column(children: [
            Avatar(radius: 40),
            SizedBox(height: 10),
            Text(namaUser,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(emailUser, style: TextStyle(fontSize: 12)),
          ]),
        ),
        const SizedBox(height: 12),
        _row(Icons.person, 'Biodata Saya', () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const DataPribadiPage()));
        }),
        _row(Icons.settings, 'Pengaturan Akun'),
        _row(Icons.shield, 'Keamanan'),
        _row(Icons.info, 'Tentang Aplikasi', () {
          showAboutDialog(
              context: context,
              applicationName: 'Tugas Pemrograman Mobile',
              applicationVersion: '1.0.0');
        }),
      ]),
    );
  }
}

// ---------- Halaman Detail (reusable) ----------
class DetailPage extends StatelessWidget {
  final String title;
  final List<List<String>> rows;
  final bool showAvatar;
  const DetailPage(
      {super.key,
        required this.title,
        required this.rows,
        this.showAvatar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Card(
          elevation: 1,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(children: [
              if (showAvatar)
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Avatar(radius: 34))),
              for (int i = 0; i < rows.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 110,
                            child: Text(rows[i][0],
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black54))),
                        Expanded(
                            child: Text(rows[i][1],
                                style: const TextStyle(fontSize: 13))),
                      ]),
                ),
                if (i != rows.length - 1) const Divider(height: 1),
              ],
            ]),
          ),
        ),
      ),
    );
  }
}

class DataPribadiPage extends StatelessWidget {
  const DataPribadiPage({super.key});
  @override
  Widget build(BuildContext context) => const DetailPage(
    title: 'Data Pribadi',
    showAvatar: true,
    rows: [
      ['Nama', namaUser],
      ['NIM', '20240801304'],
      ['Tempat, Tgl Lahir', 'Tolitoli, 01 Januari 2001'],
      ['Jenis Kelamin', 'Laki-laki'],
      ['Alamat', 'Jln. Palmerah Barat'],
      ['No. HP', '081234567890'],
      ['Email', emailUser],
    ],
  );
}

class DataPendidikanPage extends StatelessWidget {
  const DataPendidikanPage({super.key});
  @override
  Widget build(BuildContext context) => const DetailPage(
    title: 'Data Pendidikan',
    rows: [
      ['Jenjang', 'S1'],
      ['Perguruan Tinggi', 'Universitas Esa Unggul'],
      ['Fakultas', 'Ilmu Komputer'],
      ['Jurusan', 'Teknik Informatika'],
      ['Tahun Masuk', '2024'],
      ['Tahun Lulus', 'Belum Lulus'],
    ],
  );
}

class DataPekerjaanPage extends StatelessWidget {
  const DataPekerjaanPage({super.key});
  @override
  Widget build(BuildContext context) => const DetailPage(
    title: 'Data Pekerjaan',
    rows: [
      ['Status Kerja', 'Karyawan Swasta'],
      ['Perusahaan', 'PT BNI Tbk'],
      ['Jabatan', 'Command Center Technical Support'],
      ['Tahun Mulai', '2025'],
      ['Tahun Selesai', '-'],
      ['Deskripsi', 'Saat ini masih aktif bekerja'],
    ],
  );
}

class OrganisasiPage extends StatelessWidget {
  const OrganisasiPage({super.key});
  @override
  Widget build(BuildContext context) => const DetailPage(
    title: 'Organisasi',
    rows: [
      ['Nama Organisasi', 'PERMUDA Sulteng Jabodetabek'],
      ['Jabatan', 'Anggota'],
      ['Tahun Bergabung', '2024'],
      ['Sampai', 'Sekarang'],
      [
        'Deskripsi',
        'Mengikuti organisasi untuk membangun ukhuwah dan pengembangan diri.'
      ],
    ],
  );
}