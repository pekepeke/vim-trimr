if v:version < 700
  echoerr 'does not work this version of Vim(' . v:version . ')'
  finish
elseif exists('g:loaded_trimr')
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

" var
" extension(default), ignore_extension, filetype, ignore_filetype
let g:trimr_method = get(g:, 'trimr_method', 'extension')
let g:trimr_targets = get(g:, 'trimr_targets', [])
let g:trimr_removecr = get(g:, 'trimr_removecr', 0)

augroup trimr-augroup
  autocmd!
  autocmd BufWritePre * call trimr#autocmd_exec()
augroup END

command! -nargs=0 Trimr call trimr#exec()
command! -bang -nargs=0 TrimrOn call trimr#enable(1, "<bang>")
command! -bang -nargs=0 TrimrOff call trimr#enable(0, "<bang>")

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_trimr = 1

" vim: foldmethod=marker
