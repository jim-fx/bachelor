# Bachelor Arbeit

Willkommen zu meiner Bachelorarbeit :)

Dieses Repo wird wahrscheinlich für drei Monate voller Mühe, Schweiß, Blut und Tränen stehen, aber die habe ich im Moment noch vor mir.

[https://github.com/jim-fx/bachelor/releases/latest/download/expose.pdf](Latest expose.pdf)

## Inhaltsangabe

- [Anforderungen](#requirements)
- [Makefile](#makefile)
- [Roadmap](#roadmap)

## Anforderungen

Um ganz ehrlich zu sein bin ich noch nicht ganz erfahren mit dem Latex Ökosystem und es flößt mir ein bisschen Respekt ein wie oft PERL in Tutorials dazu vorkommt oder warum so viele packages So GeSchRieBen WeRdEn.

### TeXLive
```bash
sudo apt install texlive
```

### tlmgr
_Der TeXLive Package Manager_  
Sollte mit texlive installiert werden.

### Diverse latex Bibliotheken
Sind all in `common.tex` deklariert.
```bash
sudo tlmgr install xcolor inconsolata fontenc pgffor graphicx fancyhdr hyperref tcolorbox

```

## Makefile
In diesem Repo finden Sie ein praktisches `Makefile`, das PDFs aus Latexdateien erstellt. Sie können es wie folgt verwenden:

```bash
make pdf FILE=ideas
```

Oder mit dem `make watch` command automatisch bei jeder Änderung neu kompilieren lassen.

```bash
make watch FILE=expose
# Öffnen Sie „localhost:8080/#expose“ in Ihrem Browser und beobachten Sie, wie die *Magie* geschieht
```

## Roadmap
