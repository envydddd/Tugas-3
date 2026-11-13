import 'package:flutter/material.dart';

// Entry point utama aplikasi Flutter TabungKu
void main() {
  runApp(const TabungApp());
}

// Widget root aplikasi yang mengatur tema dan halaman awal
class TabungApp extends StatelessWidget {
  const TabungApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabungKu Layout',
      theme: ThemeData(
        // Skema warna dasar aplikasi (Teal & Material 3)
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006666),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // Menampilkan halaman utama RingkasanPage
      home: const RingkasanPage(),
    );
  }
}

// Halaman Ringkasan Tabungan dengan Scaffold, AppBar, dan tata letak responsif
class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      // AppBar dengan judul "Ringkasan Tabungan"
      appBar: AppBar(
        title: const Text(
          'Ringkasan Tabungan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF006666),
        elevation: 2,
      ),
      // Body dengan SafeArea dan SingleChildScrollView untuk mencegah overflow pada berbagai ukuran layar
      body: SafeArea(
        child: SingleChildScrollView(
          // Alignment di bagian atas tengah layar
          child: Align(
            alignment: Alignment.topCenter,
            // Container dengan pembatas maxWidth (700) agar tampilan responsif di layar tablet/lebar
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              padding: const EdgeInsets.all(16.0),
              // Column utama penyusun komponen halaman secara vertikal
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Teks ucapan selamat datang
                  const Text(
                    'Halo, Selamat Datang! 👋',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Komponen 1: Kartu Ringkasan Tabungan (Saldo & Target)
                  _buildKartuTabungan(),
                  const SizedBox(height: 20),
                  // Komponen 2: Baris Tombol/Ikon Kategori Ringkas (Menabung, Tarik, Riwayat)
                  _buildBarisKategori(),
                  const SizedBox(height: 24),
                  // Komponen 3: Daftar Sederhana Riwayat Transaksi (Judul, Tanggal, Nominal)
                  _buildDaftarTransaksi(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget penyusun Card ringkasan tabungan (Nama tabungan, Saldo, Target, dan Progress)
  Widget _buildKartuTabungan() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: const Color(0xFF006666),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row bagian atas: Icon + Nama Tabungan dan Badge Kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_rounded,
                      color: Colors.white70,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Tabungan Impian',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0x33FFFFFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Utama',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Tampilan Informasi Saldo
            const Text(
              'Total Saldo saat ini',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Rp 15.750.000',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 20),
            // Garis pemisah transparan
            Container(
              height: 1,
              color: Colors.white24,
            ),
            const SizedBox(height: 16),
            // Row bagian bawah: Target Tabungan dan Persentase Pencapaian
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Target Tabungan',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Rp 25.000.000',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Pencapaian',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '63%',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Progress Bar visualisasi target tabungan
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const LinearProgressIndicator(
                value: 0.63,
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amberAccent),
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget penyusun Baris Kategori 3 tombol/ikon (Menabung, Tarik, Riwayat)
  Widget _buildBarisKategori() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      // Row dengan alignment spaceAround untuk distribusi item kategori yang simetris
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildKategoriItem(
            icon: Icons.add_circle_outline_rounded,
            label: 'Menabung',
            color: const Color(0xFF006666),
          ),
          Container(height: 30, width: 1, color: Colors.grey.shade200),
          _buildKategoriItem(
            icon: Icons.remove_circle_outline_rounded,
            label: 'Tarik',
            color: const Color(0xFFD9534F),
          ),
          Container(height: 30, width: 1, color: Colors.grey.shade200),
          _buildKategoriItem(
            icon: Icons.history_rounded,
            label: 'Riwayat',
            color: const Color(0xFF0275D8),
          ),
        ],
      ),
    );
  }

  // Sub-widget untuk item ikon dan label kategori
  Widget _buildKategoriItem({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 26,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Widget penyusun Daftar Riwayat Transaksi
  Widget _buildDaftarTransaksi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Judul Seksi Transaksi Terakhir
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaksi Terakhir',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'Lihat Semua',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF006666),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Item-item Transaksi (Minimal 3 item statis)
        _buildItemTransaksi(
          judul: 'Setoran Bulanan',
          tanggal: '12 Nov 2026',
          nominal: '+ Rp 1.500.000',
          isMasuk: true,
          icon: Icons.arrow_downward_rounded,
        ),
        _buildItemTransaksi(
          judul: 'Beli Laptop Kerja',
          tanggal: '08 Nov 2026',
          nominal: '- Rp 4.200.000',
          isMasuk: false,
          icon: Icons.shopping_bag_outlined,
        ),
        _buildItemTransaksi(
          judul: 'Bonus Proyek Akhir',
          tanggal: '01 Nov 2026',
          nominal: '+ Rp 2.000.000',
          isMasuk: true,
          icon: Icons.workspace_premium_rounded,
        ),
        _buildItemTransaksi(
          judul: 'Buku Pemrograman Flutter',
          tanggal: '28 Okt 2026',
          nominal: '- Rp 250.000',
          isMasuk: false,
          icon: Icons.menu_book_rounded,
        ),
      ],
    );
  }

  // Sub-widget Card item riwayat transaksi (Judul, Tanggal, dan Nominal)
  Widget _buildItemTransaksi({
    required String judul,
    required String tanggal,
    required String nominal,
    required bool isMasuk,
    required IconData icon,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            // Container Icon Jenis Transaksi (Masuk / Keluar)
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isMasuk
                    ? const Color(0xFF2E7D32).withValues(alpha: 0.1)
                    : const Color(0xFFC62828).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isMasuk ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
                size: 22,
              ),
            ),
            const SizedBox(width: 14),
            // Column Informasi Judul dan Tanggal Transaksi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            // Teks Nominal Transaksi
            Text(
              nominal,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isMasuk ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
