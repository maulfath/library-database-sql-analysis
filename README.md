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

![Screenshot Kueri 1](Screenshot%2026-08-15%20003816.png)

**Insight:** Buku dengan kategori **Bahasa** dan **Sains** merupakan primadona perpustakaan dengan jumlah peminjam unik terbanyak. Hal ini mengindikasikan tingginya kebutuhan literasi akademik di kalangan anggota.

### 2. Siapa Anggota Paling Aktif & Berapa Total Denda Mereka?
**Kueri:** Menggunakan *Common Table Expression* (`CTE`) untuk menghitung frekuensi peminjaman dan akumulasi denda per anggota sebelum digabungkan (`JOIN`) dengan data profil anggota.

![Screenshot Kueri 2](Screenshot%2026-08-15%20004551.png)

**Insight:** Anggota berstatus **Mahasiswa** mendominasi daftar peminjam paling aktif. Namun, beberapa dari mereka juga menyumbang denda keterlambatan terbesar, yang menunjukkan perlunya evaluasi sistem pengembalian.

### 3. Bagaimana Tren Performa Peminjaman Bulanan?
**Kueri:** Menggunakan fungsi manipulasi tanggal `DATE_FORMAT` untuk mengelompokkan total transaksi dan pendapatan denda dari bulan ke bulan.

![Screenshot Kueri 3](Screenshot%2026-08-15%20004636.png)

**Insight:** Terdapat fluktuasi peminjaman per bulan. Data pendapatan denda yang terkumpul ini dapat dievaluasi untuk dialokasikan guna menambah koleksi buku baru.

---

## 💡 Business Recommendations
1. **Fokus Inventaris:** Alokasikan anggaran lebih untuk memperbanyak eksemplar buku kategori "Bahasa" dan "Sains" guna menghindari kekosongan stok.
2. **Loyalty Program:** Berikan *reward* bagi anggota dengan rekam jejak meminjam paling aktif namun selalu tepat waktu mengembalikan buku.
3. **Sistem Pengingat:** Terapkan notifikasi otomatis H-1 sebelum batas waktu pengembalian untuk meminimalisir buku hilang dan membengkaknya denda, terutama bagi kelompok Mahasiswa.
