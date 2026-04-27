# Resume build targets
# Usage:
#   make            → Resume.pdf
#   make variant V=google → builds variants/google.tex → Resume_google.pdf
#   make clean      → remove build artifacts

LATEX = pdflatex -interaction=nonstopmode

.PHONY: all variant clean

all:
	$(LATEX) -jobname=Resume Resume.tex
	$(LATEX) -jobname=Resume Resume.tex

variant:
	$(LATEX) -jobname=Resume_$(V) "\input{variants/$(V)}"
	$(LATEX) -jobname=Resume_$(V) "\input{variants/$(V)}"

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk
