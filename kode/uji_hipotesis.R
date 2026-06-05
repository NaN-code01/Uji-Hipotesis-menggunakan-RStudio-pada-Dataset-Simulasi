# mengambil folder tempat script ini berada
script_dir <- dirname(normalizePath(sys.frame(1)$ofile))

# path file sample
backend_path <- file.path(
  script_dir,
  "dataset",
  "backend_sample.csv"
)

frontend_path <- file.path(
  script_dir,
  "dataset",
  "frontend_sample.csv"
)

# membaca data sample
backend_data <- read.csv(backend_path)
frontend_data <- read.csv(frontend_path)

# --- Langkah Uji Hipotesis ---
# Uji Hipotesis bagi Rata-rata Dua Populasi - Ragam kedua populasi diasumsikan sama (uji t)
# Hipotesis 1 arah - ekor kanan

# Hipotesis: gaji tahunan rata-rata Backend Developer lebih besar daripada Frontend Developer
# Dengan taraf signifikansi 1% (alpha = 0.01)

# Langkah 1: Masukkan data sampel ke dalam dua vektor terpisah
backend <- backend_data$salary
frontend <- frontend_data$salary

# Langkah 2: Tentukan parameter uji
alpha <- 0.01
mu_hipotesis_selisih <- 0
# Selisih yang diuji adalah 0
# H0: μBackend - μFrontend <= 0
# H1: μBackend - μFrontend > 0

# Langkah 3: Lakukan Uji-t dua sampel dengan asumsi ragam sama
# - alternative = "greater" karena H1: μBackend > μFrontend
# - mu = 0                  karena selisih hipotesis adalah 0
# - var.equal = TRUE        karena asumsi ragam homogen (sama)
hasil_uji <- t.test(
  backend,
  frontend,
  alternative = "greater",
  mu = mu_hipotesis_selisih,
  var.equal = TRUE
)

# --- Perhitungan Nilai Kritis dan Interpretasi ---

# Langkah 4: Hitung nilai t-kritis untuk uji sisi kanan
# Derajat kebebasan (df) = n1 + n2 - 2
df <- hasil_uji$parameter

t_kritis <- qt(
  p = alpha,
  df = df,
  lower.tail = FALSE
)

# Langkah 5: Ekstrak nilai t-hitung dan p-value
t_hitung <- hasil_uji$statistic
p_value <- hasil_uji$p.value

# --- Tampilkan Hasil (Terformat) ---

# Ambil info tambahan dari hasil_uji
n_backend  <- length(backend)
n_frontend <- length(frontend)
mean_backend  <- mean(backend)
mean_frontend <- mean(frontend)

kesimpulan <- if (t_hitung > t_kritis) {
  "Tolak H0: Cukup bukti bahwa rata-rata gaji Backend Developer\n  lebih besar daripada Frontend Developer."
} else {
  "Gagal Tolak H0: Tidak cukup bukti bahwa rata-rata gaji Backend Developer\n  lebih besar daripada Frontend Developer."
}

cat("╔══════════════════════════════════════════════════════════╗\n")
cat("║           HASIL UJI HIPOTESIS - UJI T DUA SAMPEL         ║\n")
cat("╚══════════════════════════════════════════════════════════╝\n")
cat("\n")

cat("── HIPOTESIS ───────────────────────────────────────────────\n")
cat("  H0 : μ Backend - μ Frontend  <=  0\n")
cat("  H1 : μ Backend - μ Frontend  >   0  (uji satu arah / ekor kanan)\n")
cat("\n")

cat("── DATA SAMPEL ─────────────────────────────────────────────\n")
cat(sprintf("  Jumlah sampel Backend    : %d\n",  n_backend))
cat(sprintf("  Jumlah sampel Frontend   : %d\n",  n_frontend))
cat(sprintf("  Rata-rata gaji Backend   : %.2f\n", mean_backend))
cat(sprintf("  Rata-rata gaji Frontend  : %.2f\n", mean_frontend))
cat("\n")

cat("── PARAMETER UJI ───────────────────────────────────────────\n")
cat(sprintf("  Taraf signifikansi (α)   : %.2f\n", alpha))
cat(sprintf("  Derajat kebebasan (df)   : %d\n",   as.integer(df)))
cat("\n")

cat("── HASIL PERHITUNGAN ───────────────────────────────────────\n")
cat(sprintf("  t-hitung                 : %.4f\n", t_hitung))
cat(sprintf("  t-kritis                 : %.4f\n", t_kritis))
cat(sprintf("  p-value                  : %.6f\n", p_value))
cat("\n")

cat("── KRITERIA PENOLAKAN ──────────────────────────────────────\n")
cat("  Tolak H0 jika  t-hitung > t-kritis\n")
cat(sprintf("  %.4f  %s  %.4f  →  %s\n",
            t_hitung,
            ifelse(t_hitung > t_kritis, ">", "<="),
            t_kritis,
            ifelse(t_hitung > t_kritis, "Tolak H0", "Gagal Tolak H0")
))
cat("\n")

cat("── KESIMPULAN (pada taraf signifikansi 1%) ─────────────────\n")
cat(sprintf("  %s\n", kesimpulan))
cat("────────────────────────────────────────────────────────────\n")