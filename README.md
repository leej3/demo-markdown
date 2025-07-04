# Advanced Data Analysis Document

A comprehensive example of structuring complex documents in markdown with multiple sections, tables, and academic references. This project demonstrates how to create professional research documents using markdown that can be converted to PDF, DOCX, and HTML using pandoc.

## Features

- **Modular Structure**: Each chapter in its own markdown file for easy editing
- **Rich Content**: Complex tables, statistical data, code blocks, and mathematical expressions
- **Academic Citations**: Proper BibTeX references with automatic formatting
- **Multiple Output Formats**: PDF, DOCX, HTML, and standalone HTML
- **Professional Formatting**: YAML front matter with table of contents, numbering, and styling
- **Modern Pandoc**: Uses latest pandoc syntax with built-in `--citeproc`

## Project Structure

```
demo-markdown/
├── README.md                           # This file
├── Dockerfile                          # Container for consistent builds
├── build.sh                            # Build script for all formats
├── main.md                             # Master file with includes (Quarto-style)
├── main-consolidated.md                # Single file with all content (pandoc-compatible)
├── references.bib                      # Academic references in BibTeX format
├── chicago-author-date.csl            # Citation style file
├── 01-introduction.md                  # Introduction section
├── 02-methodology.md                   # Methodology section
├── 03-results.md                       # Results section
├── 04-conclusion.md                    # Conclusion section
└── output/                             # Generated documents
    ├── advanced-data-analysis.pdf      # PDF version
    ├── advanced-data-analysis.docx     # Word document
    ├── advanced-data-analysis.html     # HTML version
    └── advanced-data-analysis-standalone.html
```

## Prerequisites

### Local Installation

You need the following tools installed:

- **pandoc** (version 2.11 or later)
- **pdflatex** (for PDF generation)
- **Basic LaTeX packages** (usually included with TeX Live or MiKTeX)

#### macOS Installation
```bash
# Install pandoc
brew install pandoc

# Install LaTeX (MacTeX)
brew install --cask mactex
```

#### Ubuntu/Debian Installation
```bash
# Install pandoc
sudo apt-get update
sudo apt-get install pandoc

# Install LaTeX
sudo apt-get install texlive-latex-base texlive-latex-recommended texlive-latex-extra
```

#### Windows Installation
1. Download and install [pandoc](https://pandoc.org/installing.html)
2. Install [MiKTeX](https://miktex.org/download) or [TeX Live](https://www.tug.org/texlive/)

### Docker Installation (Recommended)

Alternatively, use Docker for consistent builds without installing dependencies:

**Option 1: Optimized Build (Fast)**
```bash
# Build the optimized Docker image (only installs essential packages)
#  NOTE: On apple silicon set the following env var: DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -t markdown-doc .

# Run the container to build documents
docker run --rm -v $(pwd)/output:/app/output markdown-doc
```

**Option 2: Pre-built Image (Fastest)**
```bash
# Use pandoc image directly (no build required)
docker run --rm -v $(pwd):/data pandoc/latex:latest /bin/bash -c "cd /data && ./build.sh"
```

## Usage

### Quick Start

1. **Clone or download this repository**
2. **Make the build script executable**:
   ```bash
   chmod +x build.sh
   ```
3. **Run the build script**:
   ```bash
   ./build.sh
   ```
4. **Check the output directory** for generated documents

### Individual Format Commands

**PDF:**
```bash
pandoc main-consolidated.md \
  --pdf-engine=pdflatex \
  --toc \
  --number-sections \
  --bibliography=references.bib \
  --citeproc \
  -o output/document.pdf
```

**DOCX:**
```bash
pandoc main-consolidated.md \
  --toc \
  --number-sections \
  --bibliography=references.bib \
  --citeproc \
  -o output/document.docx
```

**HTML:**
```bash
pandoc main-consolidated.md \
  --toc \
  --number-sections \
  --bibliography=references.bib \
  --citeproc \
  -o output/document.html
```

### Using Docker

**Option 1: Custom Image (Optimized)**
```bash
# Build all formats
docker run --rm -v $(pwd)/output:/app/output markdown-doc

# Build specific format  
docker run --rm -v $(pwd)/output:/app/output markdown-doc ./build.sh pdf
```

**Option 2: Pre-built Image (No Build Time)**
```bash
# Build all formats
docker run --rm -v $(pwd):/data pandoc/latex:latest /bin/bash -c "cd /data && ./build.sh"

# Build specific format
docker run --rm -v $(pwd):/data pandoc/latex:latest /bin/bash -c "cd /data && ./build.sh pdf"
```

## Customization

### Editing Content

1. **For major changes**: Edit the individual section files (`01-introduction.md`, `02-methodology.md`, etc.)
2. **For pandoc builds**: Update `main-consolidated.md` with your changes
3. **For references**: Add new entries to `references.bib` in BibTeX format

### Styling

- **PDF styling**: Modify YAML front matter in `main-consolidated.md`
- **HTML styling**: Create a `styles.css` file and reference it in the build script
- **Citation style**: Replace `chicago-author-date.csl` with your preferred CSL file

### YAML Front Matter Options

```yaml
---
title: "Your Document Title"
author: "Author Name"
date: "2024"
bibliography: references.bib
toc: true                    # Table of contents
toc-depth: 3                 # TOC depth
number-sections: true        # Number sections
geometry: margin=1in         # Page margins
fontsize: 12pt              # Font size
linestretch: 1.5            # Line spacing
---
```

## Sample Content

The document includes realistic examples of:

- **Complex Tables**: Multi-column tables with data and formatting
- **Statistical Analysis**: Hypothesis testing, regression analysis, confidence intervals
- **Code Blocks**: Python examples with syntax highlighting
- **Mathematical Expressions**: Statistical formulas and equations
- **Academic Citations**: Proper in-text citations and bibliography
- **Professional Structure**: Abstract, methodology, results, conclusion

## Troubleshooting

### Common Issues

**1. LaTeX Unicode Errors**
```
Error: Unicode character not set up for use with LaTeX
```
- Solution: Replace Unicode characters (₁, ₂, ²) with ASCII equivalents (1, 2, ^2)

**2. Missing pandoc-citeproc**
```
Error: Could not find executable pandoc-citeproc
```
- Solution: Use `--citeproc` instead of `--filter pandoc-citeproc` (fixed in this project)

**3. PDF Generation Fails**
```
Error producing PDF
```
- Ensure LaTeX is installed and accessible in PATH
- Check for special characters that LaTeX cannot handle
- Use Docker for consistent environment

**4. Citations Not Working**
```
Warning: Failed to parse bibliography
```
- Validate your BibTeX entries in `references.bib`
- Ensure citation keys match between markdown and bibliography

### Docker Troubleshooting

**Slow Docker Build:**
The Dockerfile is optimized to install only essential packages. If you need additional LaTeX packages, either:
- Add them to the Dockerfile's `tlmgr install` line, or  
- Use Option 2 (pre-built image) which includes a full LaTeX installation

**Permission Issues:**
```bash
# On Linux/macOS, ensure output directory is writable
chmod 755 output/
```

**Image Build Fails:**
```bash
# Clean build without cache
docker build --no-cache -t markdown-doc .
```

## Contributing

Feel free to:
- Add more content sections
- Improve styling and formatting
- Add new output formats
- Enhance the build process
- Submit issues and suggestions

## License

This project is provided as an example and template. Feel free to use and modify for your own documents.

## References

- [Pandoc Documentation](https://pandoc.org/MANUAL.html)
- [BibTeX Format Guide](https://www.bibtex.org/Format/)
- [Citation Style Language](https://citationstyles.org/)
- [LaTeX Documentation](https://www.latex-project.org/help/documentation/)

---

*This document was generated using the same markdown-to-multiple-formats process it demonstrates.* 