vim-trimr
=========

trim trailing white space
Version: 0.0.1
OriginalAuthor: acustodioo <http://github.com/acustodioo>
Author : pekepeke <pekepekesamurai+vim@gmail.com>
License: MIT
         <http://www.gnu.org/licenses/gpl.html>

*vim-trimr* is a Vim plugin to provide trim trailing white space
on |BufSavePre|

Latest version:
	https://github.com/pekepeke/vim-trimr


### CUSTOMIZE

#### g:trimr_method

|g:trimr_method| specify how to trim trailing white space (default:exts).
Available parameters are `filetype`, `ignore_filetype`, `extension` and `ignore_extension`

#### g:trimr_targets

|g:trimr_targets| specify the target to trim trailing white space (default:[])

#### g:trimr_removecr

|g:trimr_removecr| specify whether to remove cr (default:0)


