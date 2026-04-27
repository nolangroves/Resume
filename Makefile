# Resume build targets
# Usage:
#   make visual          → Resume_Visual.pdf
#   make ats             → Resume_ATS.pdf
#   make all             → both
#   make variant V=google → builds variants/google.tex → Resume_google.pdf
#   make clean           → remove build artifacts

LATEX = pdflatex -interaction=nonstopmode

.PHONY: all visual ats variant clean

all: visual ats

visual:
	$(LATEX) -jobname=Resume_Visual Resume.tex
	$(LATEX) -jobname=Resume_Visual Resume.tex

ats:
	$(LATEX) -jobname=Resume_ATS "\def\ATSMODE{1}\input{Resume}"
	$(LATEX) -jobname=Resume_ATS "\def\ATSMODE{1}\input{Resume}"

# Build a variant: make variant V=google
# Produces Resume_google.pdf and Resume_google_ATS.pdf
variant:
	$(LATEX) -jobname=Resume_$(V) "\input{variants/$(V)}"
	$(LATEX) -jobname=Resume_$(V) "\input{variants/$(V)}"
	$(LATEX) -jobname=Resume_$(V)_ATS "\def\ATSMODE{1}\input{variants/$(V)}"
	$(LATEX) -jobname=Resume_$(V)_ATS "\def\ATSMODE{1}\input{variants/$(V)}"

clean:
	rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk
