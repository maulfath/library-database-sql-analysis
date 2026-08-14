```sql
-- 1. Membuat Tabel Master Kategori & Rak
CREATE TABLE kategori (
    id_kategori VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(50),
    deskripsi TEXT
);

CREATE TABLE rak (
    id_rak VARCHAR(10) PRIMARY KEY,
    deskripsi VARCHAR(100)
);

-- 2. Membuat Tabel Master Penerbit & Penulis
CREATE TABLE penerbit (
    id_penerbit VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100),
    kota VARCHAR(50),
    alamat TEXT,
    email VARCHAR(100)
);

CREATE TABLE penulis (
    no_ktp VARCHAR(20) PRIMARY KEY,
    nama_lengkap VARCHAR(100),
    nama_pena VARCHAR(50),
    email VARCHAR(100),
    alamat TEXT
);

-- 3. Membuat Tabel Master Buku & Relasi Penulis
CREATE TABLE buku (
    id_buku VARCHAR(10) PRIMARY KEY,
    judul VARCHAR(200),
    tahun INT,
    id_penerbit VARCHAR(10),
    jml_hal INT,
    sinopsis TEXT,
    id_kategori VARCHAR(10),
    id_rak VARCHAR(10),
    tgl_input DATE,
    harga_buku DECIMAL(10,2) DEFAULT 50000.00,
    stok_buku INT DEFAULT 5
);

CREATE TABLE buku_penulis (
    id_buku VARCHAR(10),
    id_penulis VARCHAR(20)
);

-- 4. Membuat Tabel Entitas Anggota
CREATE TABLE anggota (
    id_anggota VARCHAR(10) PRIMARY KEY,
    nama_anggota VARCHAR(100) NOT NULL,
    no_telp VARCHAR(15),
    alamat TEXT,
    tipe_anggota ENUM('Siswa', 'Mahasiswa', 'Umum') DEFAULT 'Mahasiswa',
    tgl_daftar DATE
);

-- 5. Membuat Tabel Transaksional Peminjaman
CREATE TABLE peminjaman (
    id_peminjaman VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10),
    tgl_pinjam DATE NOT NULL,
    tgl_kembali DATE,
    status_kembali ENUM('Dipinjam', 'Kembali', 'Terlambat', 'Hilang') DEFAULT 'Kembali',
    denda DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE detail_peminjaman (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_peminjaman VARCHAR(10),
    id_buku VARCHAR(10)
);