# dotmatrix-pdf

Turns a Markdown file into a PDF that looks like a 1980s manual printed on a dot-matrix printer. The cover is goldenrod with a double frame, the pages are off-white, and the DotMatrix font is used throughout.

```bash
./dotmatrix-pdf.sh manual.md            # writes manual.pdf
./dotmatrix-pdf.sh manual.md out.pdf
```

You need pandoc 3 or later, xelatex (MacTeX or TeX Live), and the DotMatrix font family in `~/Library/Fonts`.

- **Cover, headers and contents page:** filled in from the YAML front matter. The supported fields are listed at the top of [dotmatrix-pdf.sh](dotmatrix-pdf.sh). [example.md](example.md) uses all of them; see [example.pdf](example.pdf) for the result.
- **Okimate printouts:** with [Okifake](https://github.com/factus10/okifake) installed in `~/Documents/github/okifake`, or wherever `OKIFAKE_HOME` points, images marked `{.okimate}` print as Okimate 10/20 color printouts. Code blocks marked `{.okimate}` print in the Okimate 10's own font. See [okimate-example.md](okimate-example.md) and [okimate-example.pdf](okimate-example.pdf).
