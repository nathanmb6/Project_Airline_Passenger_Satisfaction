# Project_Airline_Passenger_Satisfaction

Proyek ini berfokus pada analisis tingkat kepuasan penumpang penerbangan dengan menggunakan dataset Tingkat Kepuasan Penumpang Penerbangan yang tersedia di https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction.

# Data Cleaning

Excel:
  1. Import file CSV untuk melihat nama-nama kolom dan jumhlah banyaknya data
  2. Mengambil 20.000 baris saja dari masing2 file CSV Review1 & Review2
  3. Menyesuaikan tipe data & struktur kolom

MySQL:
  1. Mengimpor file CSV ke dalam database, lalu membuat dua tabel dengan nama review1 & review2.
  2. Menyesuaikan tipe data dan struktur kolom sesuai kebutuhan.
  3. Melakukan data cleaning yang kosong, duplikat, atau tidak akurat dalam kolom-kolom tertentu.
  4. Membuat kolom baru bernama Age_Category dengan mengartikan kolom Umur (Age), untuk meningkatkan pemahaman data.

Python:
  1. Membuat koneksi ke database MySQL.
  2. Meninjau kembali data untuk memastikan tidak ada yang hilang, duplikat, atau tidak akurat.

# Data Exploration

MySQL:
  1. Memeriksa tingkat kepuasan pelanggan antara penumpang wanita & pria.
  2. Membandingkan tingkat kepuasan berdasarkan jenis perjalanan.
  3. Menganalisis perbedaan tingkat kepuasan di antara kelas penerbangan (Bisnis, Ekonomi, Ekonomi Plus).
  4. Menyelidiki variasi tingkat kepuasan antara pelanggan setia dan non-setia.

Python:
  1. Membandingkan rating tentang Pelayanan Elektronic Maskapai antara kepuasan Loyal Customer & Disloyal Customer?.
  2. Mengidentifikasi layanan dengan dampak paling signifikan pada kepuasan pelanggan.
  3. Menjelajahi potensi hubungan antara kepuasan pelanggan dan kualitas produk-produk maskapai.

# Data Visualization
  Untuk visualisasi data, saya menggunakan Matplotlib dan Seaborn. Harap dicatat bahwa semua visualisasi dihasilkan menggunakan Python dan hanya hasil Data Exploration Python saja.
