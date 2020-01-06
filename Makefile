BIB_FILE=cv.bib
TEX_CV=cv.tex
TEX_LETT=letter.tex
# LATEXMK_TAG= -f -pdf -quiet -view=none -pdflatex='xelatex -interaction=nonstopmode'
LATEXMK_TAG= -f -pdf -quiet -view=none -pdflatex='lualatex -interaction=nonstopmode'
DIFF_TAG= --exclude-textcmd="section,subsection,figure,equation,subequation" --config="PICTUREENV=(?:section|DIFnomarkup)[*]*" --graphics-markup=0 --disable-citation-markup
PDFLATEX_TAG= -interaction=nonstopmode -draftmode


all: cv letter

cv:	
	latexmk $(LATEXMK_TAG) $(TEX_CV)

letter:	
	latexmk $(LATEXMK_TAG) $(TEX_LETT)

clean:
	latexmk -C


clean-all:
	latexmk -C
	rm -f $(IMG_PATH)/*.pdf	#clean up pdf
