---
title: "E X A M P L E"
subtitle: "Document Title"
description: "A demonstration of the DotMatrix PDF template"
short-title: "EXAMPLE"
header-right: "Demo Document"
author:
  - "J. Doe"
  - "A. Smith"
author-label: "Prepared by"
credit:
  - "Based on original research"
  - "With additional commentary"
publisher: "ZEBRA SYSTEMS"
year: "1986"
system: "Timex Sinclair 2068"
toc: true
toc-note: "This is an example document showing all supported features."
footer-note: "Example Document -- End of file"
---

# Introduction

This is an example document demonstrating the **DotMatrix PDF** template.
It converts Markdown into a 1980s dot-matrix style PDF with a goldenrod
cover page, table of contents, and the DotMatrix font throughout.

You can use all standard Markdown features:

- **Bold text** for emphasis
- *Italic text* for notes
- `inline code` for technical terms
- [Links](https://example.com) for references

## Features

The template supports:

1. YAML front matter for metadata
2. Automatic cover page generation
3. Table of contents
4. Numbered sections
5. Code blocks with syntax highlighting
6. Tables
7. Lists (ordered and unordered)

# Code Examples

Fenced code blocks are rendered in the DotMatrix font:

```
10 PRINT "HELLO WORLD"
20 GOTO 10
```

You can also specify a language for syntax coloring:

```python
def fibonacci(n):
    # Generate Fibonacci sequence
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

for num in fibonacci(10):
    print(num)
```

And assembly code works well too:

```asm
    org 0ED38h

initiate_sprites:
    ld hl,screen_rows       ; Point to the screen height variable
    ld (hl),018h            ; Default to 24 rows (full screen)
    ld c,a                  ; C = sprite count
    ld b,000h               ; B = 0
    ret
```

# Tables

Tables are supported using standard Markdown syntax:

| Address | Hex   | Contents                  |
|---------|-------|---------------------------|
| 60160   | EB00h | Command parser            |
| 60728   | ED38h | Service routines          |
| 62680   | F4F8h | UDG (sprite graphic) data |

# Blockquotes

> This is a blockquote. It can be used for notes,
> warnings, or to call attention to important information.

# Conclusion

That covers the main features. To generate a PDF from this file:

```
./dotmatrix-pdf.sh example.md
```
