# This amazing snippets makes it so the website stays on the same scroll position when the pdf is reloaded.
# https://github.com/mozilla/pdf.js/issues/11359#issuecomment-558841393
export SOURCE_DATE_EPOCH ?= $(shell date -u +%s)

FILE = ideas
TEX_FILE = $(FILE).tex
PDF_FILE = $(FILE).pdf

pdf: $(PDF_FILE)

$(PDF_FILE): $(TEX_FILE)
	pdflatex $(TEX_FILE) && biber $(FILE) && pdflatex $(TEX_FILE)

open:
	/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe $$(wslpath -w "$$PWD/$(PDF_FILE)")

diff:
	./scripts/latex-diff.sh $(FILE)

watch:
	(live-server --no-browser --watch=$(PDF_FILE) & \
	make FILE=$(FILE)) & \
	while true; do \
			inotifywait -e modify $(TEX_FILE); \
			make FILE=$(FILE); \
	done
