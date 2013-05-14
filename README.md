vim-trimr
=========

trim trailing white space

Version: 0.0.1  
OriginalAuthor: acustodioo <http://github.com/acustodioo>  
Author : pekepeke <pekepekesamurai+vim@gmail.com>  
License: MIT <http://www.gnu.org/licenses/gpl.html>
	Permission is hereby granted, free of charge, to any person obtaining a copy  
	of this software and associated documentation files (the "Software"), to deal  
	in the Software without restriction, including without limitation the rights   
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell   
	copies of the Software, and to permit persons to whom the Software is  
	furnished to do so, subject to the following conditions:  
	The above copyright notice and this permission notice shall be included in  
	all copies or substantial portions of the Software.  
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,  
	DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,  
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE  
	OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## INTRODUCTION

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

### COMMANDS

#### :Trimr

trim trailing white spaces from current buffer.

#### :TrimrOn

enable auto trim trailing white spaces on |BufSavePre|.(buffer scope)

#### :TrimrOn!

enable auto trim trailing white spaces on |BufSavePre|.(global scope)

#### :TrimrOff

disable auto trim trailing white spaces on |BufSavePre|.(local scope)

#### :TrimrOff!

disable auto trim trailing white spaces on |BufSavePre|.(global scope)

