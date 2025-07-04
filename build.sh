#!/bin/bash

# Build script for converting markdown document to various formats using pandoc

echo "Building Advanced Data Analysis document..."

# Create output directory
mkdir -p output

# Build PDF using LaTeX
echo "Building PDF..."
pandoc main-consolidated.md \
  --from markdown+yaml_metadata_block \
  --to pdf \
  --output output/advanced-data-analysis.pdf \
  --pdf-engine=pdflatex \
  --toc \
  --toc-depth=3 \
  --number-sections \
  --bibliography=references.bib \
  --citeproc \
  --variable geometry:margin=1in \
  --variable fontsize=12pt \
  --variable linestretch=1.5 \
  --highlight-style=tango

# Build DOCX for Word
echo "Building DOCX..."
pandoc main-consolidated.md \
  --from markdown+yaml_metadata_block \
  --to docx \
  --output output/advanced-data-analysis.docx \
  --toc \
  --toc-depth=3 \
  --number-sections \
  --bibliography=references.bib \
  --citeproc

# Build HTML for web viewing
echo "Building HTML..."
pandoc main-consolidated.md \
  --from markdown+yaml_metadata_block \
  --to html \
  --output output/advanced-data-analysis.html \
  --toc \
  --toc-depth=3 \
  --number-sections \
  --bibliography=references.bib \
  --citeproc \
  --css=styles.css \
  --highlight-style=tango

# Build standalone HTML with embedded resources
echo "Building standalone HTML..."
pandoc main-consolidated.md \
  --from markdown+yaml_metadata_block \
  --to html \
  --output output/advanced-data-analysis-standalone.html \
  --toc \
  --toc-depth=3 \
  --number-sections \
  --bibliography=references.bib \
  --citeproc \
  --embed-resources \
  --standalone \
  --highlight-style=tango

echo "Build complete! Check the output directory for generated files."
echo ""
echo "Generated files:"
ls -la output/

echo ""
echo "To build individual formats:"
echo "PDF:  pandoc main-consolidated.md --pdf-engine=pdflatex --toc --number-sections --bibliography=references.bib --citeproc -o output/document.pdf"
echo "DOCX: pandoc main-consolidated.md --toc --number-sections --bibliography=references.bib --citeproc -o output/document.docx"
echo "HTML: pandoc main-consolidated.md --toc --number-sections --bibliography=references.bib --citeproc -o output/document.html" 