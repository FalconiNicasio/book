NAME=linux
HOME=../..
FINAL=$(HOME)/../pub

include ../makefile.sys

all: epub pdf authors

epub: clean version
	mkdir -p dest
	cat $(HOME)/bib/*.bib > dest/all.bib
	bookmanager $(NAME).yaml get
	mv dest/vonLaszewski-$(NAME).epub $(FINAL)/docs

pdf:
	ebook-convert \
	  $(FINAL)/docs/vonLaszewski-$(NAME).epub \
	  $(FINAL)/docs/vonLaszewski-$(NAME).pdf

bib:
	mkdir -p dest
	cp $(HOME)/bib/*.bib dest

dest: clean fonts version
	mkdir -p dest
	cat $(HOME)/bib/*.bib > dest/all.bib
	bookmanager $(NAME).yaml get
	ebook-convert \
	  dest/vonLaszewski-$(NAME).epub \
	  dest/vonLaszewski-$(NAME).pdf

version:
	TZ=":US/Eastern"; date > $(HOME)/chapters/version.md

view:
	-killall Books
	$(OPEN_EPUB) $(FINAL)/docs/vonLaszewski-$(NAME).epub

authors:
	$(HOME)/bin/authors.py > $(HOME)/chapters/authors.md

clean:
	rm -rf dest

include ../Makefile.bibtex
