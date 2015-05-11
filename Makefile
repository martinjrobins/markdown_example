outputs = markdown.pdf markdown_article.pdf markdown.docx markdown_revealjs.html markdown_slidy.html markdown_dzslides.html markdown.odt markdown_article.html markdown.tex

all: ${outputs}

extensions = 
filter = --filter pandoc-citeproc
filter = 

markdown.pdf:markdown.md
	pandoc ${filter} -f markdown$(extensions) -t beamer -V theme:Warsaw  --slide-level 1 $^ -o $@

markdown_article.pdf:markdown.md
	pandoc ${filter} -f markdown$(extensions) $^ -o $@

markdown.tex:markdown.md
	pandoc ${filter} -f markdown$(extensions) $^ -o $@

markdown.docx:markdown.md
	pandoc ${filter} -f markdown$(extensions)  $^ -o $@

markdown.odt:markdown.md
	pandoc ${filter} -f markdown$(extensions)  $^ -o $@

markdown_revealjs.html:markdown.md
	pandoc ${filter} -s --mathjax -f markdown$(extensions) -t revealjs -V theme=moon --slide-level 1 --mathjax $^ -o $@

markdown_dzslides.html:markdown.md
	pandoc ${filter} -s -f markdown$(extensions) -t dzslides --slide-level 1 --mathjax $^ -o $@

markdown_slidy.html:markdown.md
	pandoc ${filter} -s -f markdown$(extensions) -t slidy --slide-level 1 --mathjax $^ -o $@

markdown_article.html:markdown.md
	pandoc ${filter} -s -f markdown$(extensions) --mathjax $^ -o $@

clean:
	rm -f ${outputs}

