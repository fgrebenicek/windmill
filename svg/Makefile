PRINT_SVG=page_01.svg page_02.svg
PRINT_PDF=$(PRINT_SVG:.svg=.pdf)


all: print.pdf

%.pdf: %.svg
	inkscape $< -A $@

print.pdf: $(PRINT_PDF) pdfmarks
	gs -q -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sPAPERSIZE=a4 "-sOutputFile=print.pdf" $(PRINT_PDF) pdfmarks

# Alternative: 
#   pdfjoin page_01.pdf page_02.pdf --outfile print.pdf

print_join.pdf: $(PRINT_PDF) pdfmarks
	pdfjoin --outfile print_join.pdf $(PRINT_PDF)
