# 📚 Library Management System: End-to-End Database Design & SQL Analysis

**Role:** Data Analyst / Database Designer  
**Tools:** MySQL, phpMyAdmin, Advanced SQL (CTE, Window Functions, Multiple JOINs)

## 📌 Project Overview
Proyek ini merupakan simulasi *end-to-end* perancangan sistem database relasional untuk manajemen perpustakaan. Proyek dimulai dari pembuatan arsitektur tabel dari nol (*from scratch*), pengisian data transaksi, hingga penulisan kueri analitik tingkat lanjut untuk menghasilkan *actionable insights*. Wawasan ini bertujuan membantu pengelola perpustakaan dalam melacak inventaris, memahami perilaku peminjam, dan menganalisis pendapatan denda.

---

## 🛠️ Tahap 1: Database Creation & Schema Design (DDL)
Pada tahap ini, saya membangun arsitektur database relasional (RDBMS) yang terdiri dari 8 tabel yang saling terhubung. Arsitektur ini dirancang untuk mencatat data master (buku, penulis, kategori, anggota) dan data transaksional (peminjaman).

*(Seluruh kueri DDL pembuatan tabel ini dapat dilihat pada file `library_analysis.sql` di repository ini).*

![Struktur Database](<Screenshot 2026-08-15 011428.png>)

---

## 📊 Tahap 2: Business Questions & Data Analysis (DML)
Setelah kerangka database selesai dan data fiktif dimasukkan ke dalam tabel, saya menjalankan kueri analitik untuk menjawab permasalahan bisnis berikut:

### 1. Kategori Buku Apa yang Paling Populer?
**Kueri:** Menggunakan `Multiple JOIN` antara tabel `buku`, `kategori`, `peminjaman`, dan `detail_peminjaman`, serta fungsi agregasi `GROUP BY`.

![Screenshot Kueri 1](<Screenshot 2026-08-15 003816.png>)

**Insight:** Buku dengan kategori **Bahasa** dan **Sains** merupakan primadona perpustakaan dengan jumlah peminjam unik terbanyak. Hal ini mengindikasikan tingginya kebutuhan literasi akademik di kalangan anggota.

### 2. Siapa Anggota Paling Aktif & Berapa Total Denda Mereka?
**Kueri:** Menggunakan *Common Table Expression* (`CTE`) untuk menghitung frekuensi peminjaman dan akumulasi denda per anggota sebelum digabungkan (`JOIN`) dengan data profil anggota.

![Screenshot Kueri 2](<Screenshot 2026-08-15 004551.png>)

**Insight:** Anggota berstatus **Mahasiswa** mendominasi daftar peminjam paling aktif. Namun, beberapa dari mereka juga menyumbang denda keterlambatan terbesar, yang menunjukkan perlunya evaluasi sistem pengembalian.

### 3. Bagaimana Tren Performa Peminjaman Bulanan?
**Kueri:** Menggunakan fungsi manipulasi tanggal `DATE_FORMAT` untuk mengelompokkan total transaksi dan pendapatan denda dari bulan ke bulan.

![Screenshot Kueri 3](<Screenshot 2026-08-15 004636.png>)

**Insight:** Terdapat fluktuasi peminjaman per bulan. Data pendapatan denda yang terkumpul ini dapat dievaluasi untuk dialokasikan guna menambah koleksi buku baru.

---

## ⚙️ Tahap 3: Database Automation & Reporting (Views & Triggers)
Untuk meningkatkan efisiensi operasional perpustakaan, saya merancang automasi database agar sistem tidak perlu mengandalkan *input* manual secara terus-menerus.

### 1. Automasi Laporan Harian (VIEW)
Saya membuat tabel virtual (`VIEW`) bernama `v_peminjaman_aktif` untuk mempercepat proses pelaporan harian. Dengan sistem ini, staf perpustakaan hanya perlu menjalankan satu perintah sederhana (`SELECT * FROM v_peminjaman_aktif`) untuk memantau siapa saja anggota yang sedang menahan buku beserta durasi pinjamannya secara *real-time*.

*(<img width="927" height="95" alt="Screenshot 2026-08-15 020233" src="https://github.com/user-attachments/assets/34e688f0-353d-4f47-a721-726238041d7b" />)*

### 2. Automasi Inventaris Stok Buku (TRIGGER)
Untuk mencegah selisih stok (stok minus atau tidak akurat), saya menanamkan sebuah `TRIGGER` bernama `kurangi_stok_buku`. Sistem ini akan secara otomatis mengurangi angka pada kolom `stok_buku` setiap kali ada data transaksi baru yang masuk ke tabel `detail_peminjaman`.

*(<img width="628" height="70" alt="Screenshot 2026-08-15 020723" src="https://github.com/user-attachments/assets/8a113902-0790-479b-a660-25c7e7e0f922" />
<img width="632" height="76" alt="Screenshot 2026-08-15 020730" src="https://github.com/user-attachments/assets/c023e3e7-3762-4bd6-b0ce-b00af9f967e1" />)*

---

## 💡 Business Recommendations
1. **Fokus Inventaris:** Alokasikan anggaran lebih untuk memperbanyak eksemplar buku kategori "Bahasa" dan "Sains" guna menghindari kekosongan stok.
2. **Loyalty Program:** Berikan *reward* bagi anggota dengan rekam jejak meminjam paling aktif namun selalu tepat waktu mengembalikan buku.
3. **Sistem Pengingat:** Terapkan notifikasi otomatis H-1 sebelum batas waktu pengembalian untuk meminimalisir buku hilang dan membengkaknya denda, terutama bagi kelompok Mahasiswa.
4. **Digitalisasi SOP & Efisiensi Staf:** Manfaatkan sistem automasi database yang telah dibangun sebagai Standar Operasional Prosedur (SOP) harian. Staf perpustakaan kini tidak perlu mengecek fisik rak secara manual; cukup pantau tabel `v_peminjaman_aktif` setiap pagi untuk langsung mem- *follow-up* anggota yang belum mengembalikan buku, serta mengandalkan sistem *Trigger* untuk memastikan data stok di sistem selalu 100% akurat dengan kondisi fisik.
