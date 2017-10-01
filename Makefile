TEMPLATE = template.html
TEXTEMPLATE = template.tex
MDFILES := $(shell find . -name \*.md | grep -v -e "/exams/")
HTMLFILES := $(MDFILES:./%.md=docs/%.html)
PDFS := $(MDFILES:./%.md=docs/%.pdf)

$(HTMLFILES): docs/%.html: %.md $(TEMPLATE)
	mkdir -p $(@D)
	pandoc -o $@ --template=$(TEMPLATE) --mathjax --smart --filter ./makeHtml.hs $<

$(PDFS): docs/%.pdf: %.md $(TEXTEMPLATE)
	mkdir -p $(@D)
	pandoc -o $@ --template=$(TEXTEMPLATE) -t latex --listings --filter ./makeTex.hs $<

docs/development_rubric.pdf: development_rubric.md
	pandoc -o $@ --template=templateRubric.tex -t latex --listings --filter ./makeTex.hs $<

site: $(HTMLFILES) $(PDFS)

all: site
