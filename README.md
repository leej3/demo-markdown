# Advanced Data Analysis Document

A comprehensive example of structuring complex documents in markdown with multiple sections, tables, and academic references. This project demonstrates how to create professional research documents using markdown that can be converted to PDF, DOCX, and HTML using **Quarto**.

## Features

- **Modular Structure**: Each chapter in its own markdown file for easy editing
- **No Consolidation Required**: Quarto natively supports file inclusion without preprocessing
- **Rich Content**: Complex tables, statistical data, code blocks, and mathematical expressions
- **Academic Citations**: Proper BibTeX references with automatic formatting
- **Multiple Output Formats**: PDF, DOCX, HTML, and standalone HTML
- **Professional Formatting**: YAML front matter with table of contents, numbering, and styling
- **Modern Quarto**: Uses latest Quarto features with built-in citation processing

## Project Structure

```
demo-markdown/
├── README.md                           # This file
├── Dockerfile                          # Container for consistent builds
├── build.sh                            # Build script for all formats (Quarto)
├── _quarto.yml                         # Quarto project configuration
├── index.qmd                           # Front page/preface
├── references.qmd                      # References and appendices
├── references.bib                      # Academic references in BibTeX format
├── chicago-author-date.csl            # Citation style file
├── 01-introduction.md                  # Introduction section
├── 02-methodology.md                   # Methodology section
├── 03-results.md                       # Results section
├── 04-conclusion.md                    # Conclusion section
└── output/                             # Generated documents
    ├── index.html                      # HTML book version
    ├── 01-introduction.html            # Individual chapter HTML
    ├── 02-methodology.html             # Individual chapter HTML
    ├── 03-results.html                 # Individual chapter HTML
    ├── 04-conclusion.html              # Individual chapter HTML
    ├── references.html                 # References HTML
    └── Advanced-Data-Analysis-in-Modern-Business-Intelligence.docx
```

## Prerequisites

### Local Installation

You need **Quarto** installed:

#### macOS Installation
```bash
# Install Quarto
brew install quarto

# LaTeX is optional but recommended for PDF generation
brew install --cask mactex
```

#### Ubuntu/Debian Installation
```bash
# Download and install Quarto
wget https://github.com/quarto-dev/quarto-cli/releases/latest/download/quarto-linux-amd64.deb
sudo dpkg -i quarto-linux-amd64.deb

# Install LaTeX for PDF generation
sudo apt-get install texlive-latex-base texlive-latex-recommended texlive-latex-extra
```

#### Windows Installation
1. Download and install [Quarto](https://quarto.org/docs/get-started/)
2. Install [MiKTeX](https://miktex.org/download) or [TeX Live](https://www.tug.org/texlive/) for PDF generation

### Docker Installation (Recommended)

Use Docker for consistent builds without installing dependencies:

```bash
# Build the Docker image
docker build -t markdown-doc .

# Run the container to build documents
docker run --rm -v $(pwd)/output:/app/output markdown-doc
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

**All formats:**
```bash
quarto render
```

**HTML only:**
```bash
quarto render --to html
```

**DOCX only:**
```bash
quarto render --to docx
```

**PDF only:**
```bash
quarto render --to pdf
```

**Preview during development:**
```bash
quarto preview
```

### Using Docker

```bash
# Build all formats
docker run --rm -v $(pwd)/output:/app/output markdown-doc

# Build specific format
docker run --rm -v $(pwd):/data -w /data quarto/quarto:latest quarto render --to html
```

## Customization

### Editing Content

1. **Edit individual section files** (`01-introduction.md`, `02-methodology.md`, etc.)
2. **No consolidation needed** - Quarto automatically includes files based on `_quarto.yml`
3. **For references**: Add new entries to `references.bib` in BibTeX format

### Styling

- **All formats**: Modify `_quarto.yml` configuration
- **HTML styling**: Add custom CSS to `_quarto.yml`
- **Citation style**: Update `csl` field in `_quarto.yml` with your preferred CSL file

### Quarto Configuration (_quarto.yml)

```yaml
project:
  type: book
  output-dir: output

book:
  title: "Your Document Title"
  author: "Author Name"
  date: "2024"
  chapters:
    - index.qmd
    - 01-introduction.md
    - 02-methodology.md
    - 03-results.md
    - 04-conclusion.md
    - references.qmd

bibliography: references.bib
csl: chicago-author-date.csl

format:
  html:
    theme: cosmo
    toc: true
    toc-depth: 3
    number-sections: true
    
  pdf:
    documentclass: book
    geometry: margin=1in
    fontsize: 12pt
    linestretch: 1.5
    
  docx:
    toc: true
    number-sections: true
```

## Sample Content

The document includes realistic examples of:

- **Complex Tables**: Multi-column tables with data and formatting
- **Statistical Analysis**: Hypothesis testing, regression analysis, confidence intervals
- **Code Blocks**: Python examples with syntax highlighting
- **Mathematical Expressions**: Statistical formulas and equations
- **Academic Citations**: Proper in-text citations and bibliography
- **Professional Structure**: Abstract, methodology, results, conclusion

## Advantages of Quarto

- **No consolidation required**: Work directly with individual markdown files
- **Better preview**: Live preview during development
- **Integrated processing**: Built-in citation and cross-reference processing
- **Flexible output**: Multiple formats from single source
- **Modern tooling**: Active development and excellent documentation

## Troubleshooting

### Common Issues

**1. Quarto not found**
```
Error: quarto command not found
```
- Solution: Install Quarto from [quarto.org](https://quarto.org/docs/get-started/)

**2. LaTeX Unicode Errors (PDF)**
```
Error: Unicode character not set up for use with LaTeX
```
- Solution: Replace Unicode characters (₁, ₂, ²) with ASCII equivalents (1, 2, ^2)

**3. Citation Style Issues**
```
CiteprocParseError: macro editor not found
```
- Solution: Use a standard CSL file or disable CSL temporarily

**4. PDF Generation Fails**
```
Error producing PDF
```
- Ensure LaTeX is installed and accessible in PATH
- Check for special characters that LaTeX cannot handle
- Use Docker for consistent environment

### Docker Troubleshooting

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

- [Quarto Documentation](https://quarto.org/docs/)
- [Quarto Books](https://quarto.org/docs/books/)
- [BibTeX Format Guide](https://www.bibtex.org/Format/)
- [Citation Style Language](https://citationstyles.org/)

---

*This document was generated using the same markdown-to-multiple-formats process it demonstrates, now powered by Quarto.* 