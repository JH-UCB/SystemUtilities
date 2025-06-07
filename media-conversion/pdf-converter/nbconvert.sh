#!/bin/bash

# converts all .ipynb files in the current directory to PDF, 
# avoiding overwrites by using a timestamp if a PDF with the same name already exists.

for ipynb in *.ipynb
do
  base="${ipynb%.ipynb}"

  pdf_file="${base}.pdf"

  if [ -f "$pdf_file" ]; then
    timestamp=$(date +%Y%m%d%H%M%S)
    pdf_file="${base}_${timestamp}.pdf"
  fi

  jupyter nbconvert --to pdf "$ipynb" --output "$pdf_file"
done
