NAME=vim-trimr
DOC_TARGETS=README.md
.PHONY: doc

doc: check_vim_helpfile README.md
	vim-helpfile README.md > doc/$(NAME)$(*:README=).txt


check_vim_helpfile:
	-@which vim-helpfile >/dev/null 2>&1

