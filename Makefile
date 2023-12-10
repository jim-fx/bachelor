FILE = ideas
TEX_FILE = $(FILE).tex
PDF_FILE = $(FILE).pdf

all: $(PDF_FILE)

$(PDF_FILE): $(TEX_FILE)
	pdflatex $(TEX_FILE)

open:
	/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe $$(wslpath -w "$$PWD/$(PDF_FILE)")

watch:
	(live-server --no-browser --watch=$(PDF_FILE) & \
	make FILE=$(FILE)) & \
	while true; do \
			inotifywait -e modify $(TEX_FILE); \
			make FILE=$(FILE); \
	done
