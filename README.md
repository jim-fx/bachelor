# Bachelor Arbeit

Willkommen zu meiner Bachelorarbeit :)

Dieses Repo wird wahrscheinlich für drei Monate voller Mühe, Schweiß, Blut und Tränen stehen, aber die habe ich im Moment noch vor mir.

[Latest bachelor.pdf](https://github.com/jim-fx/bachelor/releases/latest/download/bachelor.pdf)
[Latest expose.pdf](https://github.com/jim-fx/bachelor/releases/latest/download/expose.pdf)

## Inhaltsangabe

- [Anforderungen](#requirements)
- [Makefile](#makefile)

## Build-Anforderungen

### TinyTex
```bash
# make sure perl is properly installed (e.g., apt install -y perl)
perl -mFile::Find /dev/null
# then install TinyTeX
wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh
```

### tlmgr
_Der TeXLive Package Manager_  
Sollte mit texlive installiert werden.

### Diverse LaTex Bibliotheken
Sind alle in `common.tex` deklariert.
```bash
sudo tlmgr install xcolor inconsolata fontenc pgffor graphicx fancyhdr hyperref tcolorbox
```

## Makefile
In diesem Repo gibts ein praktisches `Makefile`, das PDFs aus Latexdateien erstellt.

```bash
# bachelor.pdf generieren
make pdf FILE=bachelor
```

Oder mit dem `make watch` command automatisch bei jeder Änderung neu kompilieren lassen.

```bash
make watch FILE=bachelor
```
