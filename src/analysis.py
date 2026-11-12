"""Beginner-friendly analysis of the synthetic student performance dataset."""

from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd


ROOT = Path(__file__).resolve().parents[1]
DATA_FILE = ROOT / "data" / "students.csv"
IMAGE_DIR = ROOT / "images"


def load_and_clean_data() -> pd.DataFrame:
    """Load the CSV and fill missing numeric values with column medians."""
    df = pd.read_csv(DATA_FILE)
    numeric_columns = [
        "study_hours_per_day",
        "attendance_percent",
        "assignment_average",
        "final_score",
    ]
    for column in numeric_columns:
        df[column] = df[column].fillna(df[column].median())
    return df


def create_chart(df: pd.DataFrame) -> Path:
    """Save a scatter plot of study hours against final score."""
    IMAGE_DIR.mkdir(exist_ok=True)
    output_file = IMAGE_DIR / "study_vs_score.png"

    plt.figure(figsize=(8, 5))
    plt.scatter(df["study_hours_per_day"], df["final_score"], alpha=0.75)
    plt.title("Study Hours vs Final Score")
    plt.xlabel("Study hours per day")
    plt.ylabel("Final score")
    plt.grid(True, alpha=0.25)
    plt.tight_layout()
    plt.savefig(output_file, dpi=160)
    plt.close()
    return output_file


def main() -> None:
    df = load_and_clean_data()

    print("\nDATA PREVIEW")
    print(df.head())

    print("\nDESCRIPTIVE STATISTICS")
    print(df.describe().round(2))

    print("\nCORRELATIONS WITH FINAL SCORE")
    print(df.corr(numeric_only=True)["final_score"].sort_values(ascending=False).round(3))

    chart_path = create_chart(df)
    print(f"\nChart saved to: {chart_path}")


if __name__ == "__main__":
    main()
