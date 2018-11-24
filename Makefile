TARGET = main
LATEX_OPTIONS = -output-directory=build -halt-on-error -file-line-error
BIBTEX_OPTIONS = --output-directory build

.PHONY = clean view

$(TARGET):
	pdflatex $(LATEX_OPTIONS) $@
	biber $(BIBTEX_OPTIONS) $@
	pdflatex $(LATEX_OPTIONS) $@
	pdflatex $(LATEX_OPTIONS) $@

l: $(TARGET).tex
	pdflatex $(LATEX_OPTIONS) $<


clean: $(TARGET).tex
	rm -rf build/*

view:
	evince build/$(TARGET).pdf
