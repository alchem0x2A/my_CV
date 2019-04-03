BIB_FILE=cv.bib
TEX_FILE=cv.tex
LATEXMK_TAG= -f -pdf -quiet -view=none -pdflatex='xelatex -interaction=nonstopmode'
DIFF_TAG= --exclude-textcmd="section,subsection,figure,equation,subequation" --config="PICTUREENV=(?:section|DIFnomarkup)[*]*" --graphics-markup=0 --disable-citation-markup
PDFLATEX_TAG= -interaction=nonstopmode -draftmode


all: main

main:	
	latexmk $(LATEXMK_TAG) $(TEX_FILE)

clean:
	latexmk -c


clean-all:
	latexmk -C
	rm -f $(IMG_PATH)/*.pdf	#clean up pdf
