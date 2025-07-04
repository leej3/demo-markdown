# Use pandoc with LaTeX support
FROM pandoc/latex:latest

# Set working directory
WORKDIR /app

# Install only the specific packages we actually need
# This is much faster than installing entire collections
RUN tlmgr update --self && \
    tlmgr install \
    babel-english \
    csquotes \
    booktabs \
    multirow \
    pdflscape \
    hyperref && \
    rm -rf /tmp/*

# Copy source files
COPY . .

# Make build script executable
RUN chmod +x build.sh

# Default command - execute the shell script properly
ENTRYPOINT ["/bin/sh", "./build.sh"] 