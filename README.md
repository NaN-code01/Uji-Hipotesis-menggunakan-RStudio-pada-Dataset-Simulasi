# 📊 Uji Hipotesis menggunakan RStudio pada Dataset Simulasi

Proyek ini berisi analisis **uji hipotesis dua populasi** menggunakan data dari *Job Salary Prediction Dataset*. Fokus analisisnya adalah membandingkan rata-rata gaji tahunan **Backend Developer** dan **Frontend Developer** dengan asumsi ragam kedua populasi sama.

### Ringkasan Proyek

- **Topik**: Uji hipotesis rata-rata dua populasi
- **Metode**: Uji t dua sampel dengan ragam sama (*pooled t-test*)
- **Arah hipotesis**: Satu arah (ekor kanan)
- **Taraf signifikansi**: 1% (`α = 0.01`)
- **Kesimpulan analisis**: *Gagal tolak H0*

## 📉 Dataset

Dataset yang digunakan adalah **Job Salary Prediction Dataset**.

Sumber dataset:
- Kaggle: https://www.kaggle.com/datasets/nalisha/job-salary-prediction-dataset

> Catatan:
> - Dataset ini merupakan **dataset simulasi** yang digunakan untuk keperluan pembelajaran/penelitian.
> - Data `salary` merepresentasikan **gaji tahunan** (*annual salary*), dan kemungkinan menggunakan mata uang **USD**.

## 🎯 Hipotesis

Hipotesis yang diuji adalah:

- **H0**: Rata-rata gaji tahunan Backend Developer **tidak lebih besar** daripada Frontend Developer.
- **H1**: Rata-rata gaji tahunan Backend Developer **lebih besar** daripada Frontend Developer.

Dengan kata lain, pengujian dilakukan untuk melihat apakah:

> **μ_backend > μ_frontend**

### Hasil Uji Hipotesis

Berdasarkan pengujian yang dilakukan, diperoleh hasil berikut:

- **t-hitung**: `-0.1262`
- **t-kritis**: `2.5523`
- **p-value**: `0.549505`

Kriteria keputusan:

- Tolak H0 jika **t-hitung > t-kritis**

Karena nilai **t-hitung** tidak lebih besar dari **t-kritis**, maka keputusan akhirnya adalah:

**Gagal tolak H0**

Artinya, berdasarkan data dan taraf signifikansi yang digunakan, tidak terdapat bukti yang cukup untuk menyatakan bahwa rata-rata gaji tahunan Backend Developer lebih besar daripada Frontend Developer.

## 📁 Struktur Folder

Struktur folder yang disarankan:

```text
kode/
├── dataset/
│   ├── backend_sample.csv
│   ├── frontend_sample.csv
│   └── job_salary_prediction_dataset.csv
├── random_sampling.R
└── uji_hipotesis.R
```

Struktur ini sebaiknya dipertahankan agar program dapat berjalan tanpa error saat membaca path file.

## ▶️ Cara Menjalankan Program

Disarankan menggunakan **RStudio**.

### Menjalankan script di RStudio

- Untuk menampilkan output lengkap:
  - `CTRL + Shift + Enter`
- Untuk menjalankan script dengan tampilan yang lebih rapi:
  - `CTRL + Shift + S`

Output akan muncul di **Console**.

**Preview Output** `CTRL + Shift + S`

![Diagram Sistem]("preview_output.jpg")

> Catatan:
> - Sebaiknya **jangan menjalankan kode baris per baris** dengan `CTRL + Enter`, karena dapat menimbulkan error saat menentukan path file.

## 🧩 Penjelasan File Program

### `random_sampling.R`

Script ini digunakan untuk mengambil sampel dari dataset utama dan menyimpannya sebagai file CSV.

Fungsi script:
- membuat file sample jika belum ada
- menimpa file sample jika sudah ada
- menghasilkan:
  - `backend_sample.csv`
  - `frontend_sample.csv`

> Catatan:
> - Jika file sample belum tersedia, jalankan script ini terlebih dahulu sebelum menjalankan `uji_hipotesis.R`.
> - Bagian `set.seed()` dapat diubah jika ingin menghasilkan sampel yang berbeda.
> - Perubahan seed dapat memengaruhi hasil analisis dan kesimpulan.

### `uji_hipotesis.R`

Script ini digunakan untuk menjalankan perhitungan uji hipotesis.

Fungsi script:
- membaca data sample
- menghitung statistik uji
- menampilkan hasil uji hipotesis di Console


## 📝 Catatan Tambahan

> - Dataset yang digunakan bukan data nyata, sehingga hasil analisis hanya relevan untuk konteks dataset ini.
> - Jika struktur folder diubah, pastikan path di dalam script ikut disesuaikan agar program tetap berjalan dengan benar.
