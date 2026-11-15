#!/bin/bash
#
# dotmatrix-pdf.sh -- Convert Markdown to a 1980s dot-matrix style PDF
#
# Uses pandoc + xelatex with DotMatrix fonts and a goldenrod cover page.
# Metadata (title, author, etc.) comes from the YAML front matter in
# the Markdown file. See example.md for all supported fields.
#
# Usage:
#   dotmatrix-pdf.sh input.md [output.pdf]
#
# If output.pdf is omitted, uses the input basename (input.md -> input.pdf).
#
# Requirements:
#   - pandoc (>= 2.0)
#   - xelatex (TeX Live or MacTeX)
#   - DotMatrix font family in ~/Library/Fonts/
#
# Supported YAML front matter fields:
#   title:          Cover title (spaced letters look best, e.g. "M Y  T I T L E")
#   subtitle:       Displayed below title on cover and in header
#   short-title:    Used in running header if set (otherwise title is used)
#   header-right:   Right header text (defaults to subtitle)
#   description:    One-line description below subtitle on cover
#   author:         Author name(s) -- string or list
#   author-label:   Text above author name (default: "Written by")
#   credit:         Additional credit lines (list), shown on cover
#   publisher:      Publisher name on cover
#   year:           Copyright year on cover
#   system:         Target system (shown as "For the <system>")
#   toc:            true/false -- include table of contents
#   toc-note:       Italicized note at bottom of TOC page
#   footer-note:    Centered note at very end of document
#   numbersections: true/false -- number the sections (default: true)
#   okimate:        Okimate printout settings (needs Okifake, see below)
#
# Okimate printouts (optional, added 2026-11-15):
#   If Okifake is installed (OKIFAKE_HOME, default ~/Documents/github/okifake),
#   images marked {.okimate} print as Okimate 10/20 color printouts, and
#   ```{.okimate} code blocks print in the Okimate 10's own font:
#
#     ![Title screen](title.png){.okimate}
#     ![Photo](box.jpg){.okimate model=oki20 pixels=0 paper=copier}
#
#   Front matter `okimate: {all: true, paper: copier}` prints every image.
#   Printouts take the page's off-white color so they look printed on the page.
#   Rendered images are cached in .okimate-cache/ next to the Markdown file.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE="$SCRIPT_DIR/template.tex"

if [ $# -lt 1 ]; then
    echo "Usage: dotmatrix-pdf.sh input.md [output.pdf]"
    exit 1
fi

INPUT="$1"
if [ ! -f "$INPUT" ]; then
    echo "Error: file not found: $INPUT"
    exit 1
fi

if [ $# -ge 2 ]; then
    OUTPUT="$2"
else
    OUTPUT="${INPUT%.md}.pdf"
fi

if [ ! -f "$TEMPLATE" ]; then
    echo "Error: template not found: $TEMPLATE"
    exit 1
fi

OKIFAKE_HOME="${OKIFAKE_HOME:-$HOME/Documents/github/okifake}"
OKIMATE_FILTER="$OKIFAKE_HOME/integrations/pandoc/okimate.lua"
FILTER_ARGS=()
if [ -f "$OKIMATE_FILTER" ]; then
    # page color matches \definecolor{offwhite} in template.tex
    FILTER_ARGS=(--lua-filter="$OKIMATE_FILTER" -M okimate-page-color="#FCF9F0")
fi

echo "Converting: $INPUT -> $OUTPUT"

pandoc "$INPUT" \
    --pdf-engine=xelatex \
    --template="$TEMPLATE" \
    --number-sections \
    ${FILTER_ARGS[@]+"${FILTER_ARGS[@]}"} \
    -o "$OUTPUT"

echo "Done: $OUTPUT"
