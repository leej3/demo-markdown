# Use Ubuntu as base image since we need to install Quarto
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gdebi-core \
    python3 \
    python3-pip \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/latest/download/quarto-linux-amd64.deb \
    && gdebi --non-interactive quarto-linux-amd64.deb \
    && rm quarto-linux-amd64.deb

# Copy source files
COPY . .

# Make build script executable
RUN chmod +x build.sh

# Default command - execute the build script
ENTRYPOINT ["/bin/bash", "./build.sh"] 