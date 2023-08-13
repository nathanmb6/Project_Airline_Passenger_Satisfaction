# Project_Airline_Passenger_Satisfaction

Proyek ini berfokus pada analisis tingkat kepuasan penumpang penerbangan dengan menggunakan dataset Tingkat Kepuasan Penumpang Penerbangan yang tersedia di https://www.kaggle.com/datasets/teejmahal20/airline-passenger-satisfaction.

# Data Cleaning

MySQL:
  1. Mengimpor file CSV ke dalam database, menciptakan dua tabel dengan nama review1 & review2.
  2. Menyesuaikan tipe data dan struktur kolom sesuai kebutuhan.
  3. Melakukan validasi data secara menyeluruh untuk menghilangkan data yang kosong, duplikat, atau tidak akurat dalam kolom-kolom tertentu.
  4. Membuat kolom baru bernama Age_Category dengan mengartikan kolom Umur (Age), untuk meningkatkan pemahaman data.

Python:
  1. Membuat koneksi ke database MySQL.
  2. Meninjau kembali data untuk memastikan tidak ada catatan yang hilang, duplikat, atau tidak akurat.

# Data Exploration

MySQL:
  1. Memeriksa apakah tingkat kepuasan pelanggan lebih tinggi di antara penumpang perempuan atau laki-laki.
  2. Menjelajahi dampak jenis perjalanan (Perjalanan Pribadi atau Bisnis) terhadap tingkat kepuasan pelanggan.
  3. Menganalisis perbedaan tingkat kepuasan di antara kelas penerbangan (Bisnis, Ekonomi, Ekonomi Plus).
  4. Menyelidiki variasi tingkat kepuasan antara pelanggan setia dan non-setia.

Python:
  1. Menyelidiki apakah tingkat keterlambatan penerbangan, berdasarkan kelas, mempengaruhi kepuasan pelanggan.
  2. Mengidentifikasi layanan dengan dampak paling signifikan pada kepuasan pelanggan.
  3. Menjelajahi potensi hubungan antara kepuasan pelanggan dan kualitas produk-produk maskapai.

# Data Visualization
  Untuk visualisasi data, saya menggunakan Matplotlib dan Seaborn. Harap dicatat bahwa semua visualisasi dihasilkan menggunakan Python dan hanya hasil Data Exploration Python saja.
