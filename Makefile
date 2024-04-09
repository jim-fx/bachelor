# This amazing snippets makes it so the website stays on the same scroll position when the pdf is reloaded.
# https://github.com/mozilla/pdf.js/issues/11359#issuecomment-558841393
export SOURCE_DATE_EPOCH ?= $(shell date -u +%s)

FILE = ideas
TEX_FILE = $(FILE).tex
PDF_FILE = $(FILE).pdf

pdf:
	pdflatex $(FILE) && biber $(FILE) && pdflatex $(TEX_FILE)

open:
	if [ -x "$$(command -v zathura)" ]; then \
		zathura "$$(wslpath -w "$(FILE).pdf")"; \
	elif [ -f "/mnt/c/Program Files/Adobe/Acrobat DC/Acrobat/Acrobat.exe" ]; then \
		"/mnt/c/Program Files/Adobe/Acrobat DC/Acrobat/Acrobat.exe" "$$(wslpath -w "$(FILE).pdf")"; \
	elif [ -f "/mnt/c/Program Files/Mozilla Firefox/firefox.exe" ]; then \
		"/mnt/c/Program Files/Mozilla Firefox/firefox.exe" "$$(wslpath -w "$(FILE).pdf")"; \
	else \
		echo "No suitable PDF viewer found."; \
	fi

diff:
	./scripts/latex-diff.sh $(FILE)

watch:
	(live-server --no-browser --watch=$(PDF_FILE) & \
	/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe "http://localhost:8080/#$(FILE)" & \
	make FILE=$(FILE)) & \
	while true; do \
			inotifywait -e modify $(TEX_FILE); \
			make FILE=$(FILE); \
	done

clean:
	rm -f *.aux *.log *.bbl *.bcf *.blg *.run.xml
