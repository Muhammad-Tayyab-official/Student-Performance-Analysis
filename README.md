# Student Performance Analysis

A beginner-friendly Mathematics with Data Science project for learning Git and GitHub.

## Project goal
Explore a small **synthetic** student dataset and investigate how study time, attendance, and assignment performance relate to final scores.

> All records are fictional and generated for this workshop. They do not represent real students.

## Project structure
```text
Student-Performance-Analysis/
├── README.md
├── .gitignore
├── requirements.txt
├── data/
│   └── students.csv
├── src/
│   ├── analysis.py
│   └── analysis.R
├── reports/
│   └── summary.txt
└── images/
    └── (generated chart will be saved here)
```

## Getting started
1. Install Python 3.10 or newer.
2. Open a terminal in this project folder.
3. (Optional) Create and activate a virtual environment.
4. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
5. Run the analysis:
   ```bash
   python src/analysis.py
   ```

The script cleans missing values, prints descriptive statistics, calculates correlations, and saves a chart to `images/study_vs_score.png`.

### R

Install R, then run the equivalent base R analysis:
```bash
Rscript src/analysis.R
```

The R script performs the same cleaning, descriptive statistics, correlation
analysis, and chart generation without requiring additional R packages.

## Suggested Git practice
1. Create a Git repository with `git init`.
2. Check the working tree with `git status`.
3. Stage the README and dataset with `git add README.md data/students.csv`.
4. Create your first commit.
5. Add the analysis script in a second commit.
6. Create a branch named `feature/visualization`.
7. Make a small improvement and merge the branch into `main`.
8. Connect this local repository to a new GitHub repository and push it.

## Questions to explore
- Is study time positively associated with final score?
- What happens to the analysis when missing values are handled differently?
- Does attendance appear related to final score?
- Why is correlation not proof of causation?

## Limitations
This is a small synthetic teaching dataset. Any patterns are illustrative only and must not be used to make real educational decisions.
