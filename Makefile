<<<<<<< HEAD
.PHONY: clean run show view

LATEXMK=latexmk -lualatex -latexoption=-shell-escape
# TARGET=cherkashin-proposal-aicds
TARGET=

TLK=talk-ITAMS-2021-09-17

# run: $(TARGET).pdf

tlk: $(TLK).pdf

# $(TARGET).pdf $(TLK).pdf: %.pdf: %.tex
$(TLK).pdf: %.pdf: %.tex
	$(LATEXMK) $<
	$(LATEXMK) $<

clean:
	BIBINPUTS=$(BIBROOT) $(LATEXMK) -C
	rm -f *.{bbl,aux,ps,dvi,log,toc,out,vrb,snm,nav} *~ ~* *.bak *.synctex.* *.thm *-joined.pdf *.wbk *_latexmk *.fls
	# cd pics && make clean

show: $(TARGET).pdf
	evince $< &

view: $(TLK).pdf
	evince $< &
=======
# LATEX: pdflatex | xelatex | lualatex
LATEX = lualatex
LATEX_FLAGS = -shell-escape
BIBTEX = bibtex

FILES = $(patsubst %.tex, %.pdf, $(wildcard *.tex))

all: $(FILES)


%.pdf: %.tex
	$(LATEX) $(LATEX_FLAGS) $<
	$(LATEX) $(LATEX_FLAGS) $<
	-$(BIBTEX) `basename $< .tex`
	$(LATEX) $(LATEX_FLAGS) $<
	$(LATEX) $(LATEX_FLAGS) $<
	$(LATEX) $(LATEX_FLAGS) $<
	qpdf --linearize --newline-before-endstream $@ /tmp/$@
	mv /tmp/$@ $@

clean:
	-rm -f *.{log,toc,tac,aux,dvi,ps,bbl,blg,tmp,nav,out,snm,vrb,rel,cut,abs,xmpi,xmpdata,*~}
	-rm -rf out _minted* auto
	for i in $(ALLSUBDIRS); do \
	    (cd $$i; make clean) || exit 1; \
	done
	-rm $(FILES)

cleanall: clean
	-rm -rf out auto
>>>>>>> over/master
