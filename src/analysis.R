#!/usr/bin/env Rscript

# Beginner-friendly analysis of the synthetic student performance dataset.

script_file <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
script_dir <- if (length(script_file) > 0) {
  dirname(normalizePath(sub("^--file=", "", script_file[[1]])))
} else {
  getwd()
}

root <- normalizePath(file.path(script_dir, ".."))
data_file <- file.path(root, "data", "students.csv")
image_dir <- file.path(root, "images")
output_file <- file.path(image_dir, "study_vs_score.png")

load_and_clean_data <- function() {
  data <- read.csv(data_file, na.strings = c("", "NA"), stringsAsFactors = FALSE)
  numeric_columns <- c(
    "study_hours_per_day",
    "attendance_percent",
    "assignment_average",
    "final_score"
  )

  for (column in numeric_columns) {
    missing_values <- is.na(data[[column]])
    data[[column]][missing_values] <- median(data[[column]], na.rm = TRUE)
  }

  data
}

create_chart <- function(data) {
  dir.create(image_dir, recursive = TRUE, showWarnings = FALSE)
  png(output_file, width = 1280, height = 800, res = 160)
  plot(
    data$study_hours_per_day,
    data$final_score,
    main = "Study Hours vs Final Score",
    xlab = "Study hours per day",
    ylab = "Final score",
    pch = 19,
    col = adjustcolor("black", alpha.f = 0.75)
  )
  grid()
  dev.off()
}

data <- load_and_clean_data()

cat("\nDATA PREVIEW\n")
print(head(data))

cat("\nDESCRIPTIVE STATISTICS\n")
print(summary(data[c(
  "study_hours_per_day",
  "attendance_percent",
  "assignment_average",
  "final_score"
)]))

cat("\nCORRELATIONS WITH FINAL SCORE\n")
correlations <- cor(data[c(
  "study_hours_per_day",
  "attendance_percent",
  "assignment_average",
  "final_score"
)], use = "complete.obs")[, "final_score"]
print(round(sort(correlations, decreasing = TRUE), 3))

create_chart(data)
cat("\nChart saved to:", output_file, "\n")
