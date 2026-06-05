# mengambil folder tempat script ini berada
script_dir <- dirname(normalizePath(sys.frame(1)$ofile))

# menggabungkan path
dataset_path <- file.path(
  script_dir,
  "dataset",
  "job_salary_prediction_dataset.csv"
)

# membaca data frame sumber
dataFrame <- read.csv(dataset_path)

# mengambil hanya kolom job_title dan salary
dataFrame <- dataFrame[, c("job_title", "salary")]

# filter backend dan frontend
backend <- subset(dataFrame, job_title == "Backend Developer")
frontend <- subset(dataFrame, job_title == "Frontend Developer")

# menetapkan seed, untuk konsistensi random sampling - ubah jika ingin mengganti sample
set.seed(51)

# mengambil 10 sample acak pada masing-masing kategori
backend_sample <- backend[sample(nrow(backend), 10), ]
frontend_sample <- frontend[sample(nrow(frontend), 10), ]


# path output
backend_output <- file.path(
  script_dir,
  "dataset",
  "backend_sample.csv"
)

frontend_output <- file.path(
  script_dir,
  "dataset",
  "frontend_sample.csv"
)

# menyimpan hasil sample ke file CSV
write.csv(
  backend_sample,
  backend_output,
  row.names = FALSE
)

write.csv(
  frontend_sample,
  frontend_output,
  row.names = FALSE
)

# pesan konfirmasi
cat("File sample berhasil disimpan di folder dataset\n")