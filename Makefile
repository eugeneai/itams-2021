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
