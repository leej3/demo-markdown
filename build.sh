#!/bin/bash

# Build script for converting markdown document to various formats using Quarto

echo "Building Advanced Data Analysis document with Quarto..."

# Check if quarto is installed
if ! command -v quarto &> /dev/null; then
    echo "Error: Quarto CLI is not installed. Please install it from https://quarto.org/docs/get-started/"
    echo "Installation instructions:"
    echo "  macOS: brew install quarto"
    echo "  Linux: Download from https://quarto.org/docs/get-started/"
    echo "  Windows: Download from https://quarto.org/docs/get-started/"
    exit 1
fi

# Create output directory (Quarto will create it automatically, but just in case)
mkdir -p output

# Check if specific format is requested
if [ "$1" = "html" ]; then
    echo "Building HTML format..."
    quarto render --to html
elif [ "$1" = "pdf" ]; then
    echo "Building PDF format..."
    quarto render --to pdf
elif [ "$1" = "docx" ]; then
    echo "Building DOCX format..."
    quarto render --to docx
else
    # Build all formats using Quarto
    echo "Building all formats..."
    quarto render
fi

echo "Build complete! Check the output directory for generated files."
echo ""
echo "Generated files:"
ls -la output/

echo ""
echo "To build individual formats:"
echo "HTML: quarto render --to html"
echo "PDF:  quarto render --to pdf"
echo "DOCX: quarto render --to docx"
echo ""
echo "To preview the document:"
echo "quarto preview" 