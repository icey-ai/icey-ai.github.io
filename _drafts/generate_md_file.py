# import os
from datetime import datetime


def generate_md_file(filename):

    # Construct header information
    title = input("Enter the article title: ")
    date = datetime.now().strftime("%Y-%m-%d")
    categories = input("Enter article categories (separated by spaces): ").split()
    tags = input("Enter article tags (separated by spaces): ").split()

    # Construct file path
    file_path = date + "-" + filename + ".md"

    header = [
        "---",
        "layout: post",
        f"title: {title}",
        f"date: {date}",
        "categories:",
        *[f"  - {c}" for c in categories],
        "tags:",
        *[f"  - {t}" for t in tags],
        "---",
        "",
    ]

    # Create file and write header information
    with open(file_path, "w", encoding="utf-8") as file:
        file.write("\n".join(header))

    print(f"File generated: {file_path}")


# User input for file name
filename = input("Enter the desired file name: ")

generate_md_file(filename)
