---
title: "O K I M A T E"
subtitle: "Printouts in a DotMatrix manual"
short-title: "OKIMATE"
header-right: "Okifake demo"
description: "Screen dumps and listings printed through Okifake"
publisher: "ZEBRA SYSTEMS"
year: "1986"
system: "Timex Sinclair 2068"
toc: false
footer-note: "Okimate example -- End of file"
# Settings for every {.okimate} image and block (all optional):
okimate:
  model: oki10        # oki10, oki20lo, oki20
  paper: hammermill   # glossy, hammermill, copier, bond, thermal
  # all: true         # print every image, not only {.okimate} ones
---

# Screen dumps

Add `{.okimate}` after an image to print it as an Okimate 10 color
printout. Without a `width`, the printout appears at its real printed
size; `print-width` sets that size in inches.

![The title screen, Okimate 10 on Hammermill paper](okimate-example-screen.png){.okimate print-width=4}

Any Okifake setting works as an attribute, in kebab-case:

```
![Caption](screen.png){.okimate ribbon=black paper=copier age=0.3}
![Caption](photo.jpg){.okimate model=oki20 pixels=0 levels=5}
```

![Black ribbon on copier paper, aged](okimate-example-screen.png){.okimate ribbon=black paper=copier age=0.3 print-width=3}

# Listings

A code block with the `okimate` class prints in the Okimate 10's own
font. Color tags switch ribbon colors.

```{.okimate}
{blue}10 REM {red}HOME SWEET HOME
{black}20 BORDER 1: PAPER 1: CLS
30 PRINT AT 18,8;"PRESS ANY KEY"
40 PAUSE 0
```
