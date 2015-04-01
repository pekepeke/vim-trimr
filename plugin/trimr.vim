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
let g:trimr_prefer_editorconfig = get(g:, 'trimr_prefer_editorconfig', 1)
let g:trimr_targets = get(g:, 'trimr_targets', [])
let g:trimr_removecr = get(g:, 'trimr_removecr', 0)
let g:trimr_save_disable_state = get(g:, 'trimr_save_disable_state', 1)
if !exists('g:trimr_save_disable_state_path')
  let g:trimr_save_disable_state_path = expand('~/.trimr-state')
endif

augroup trimr-augroup
  autocmd!
  autocmd BufWritePre * call trimr#autocmd_exec()
  if g:trimr_save_disable_state
    autocmd VimLeavePre * call trimr#state_save()
  endif
augroup END

command! -range=% -nargs=0 Trimr call trimr#from_to(<line1>, <line2>)
command! -bang -nargs=0 TrimrOn call trimr#enable(1, "<bang>")
command! -bang -nargs=0 TrimrOff call trimr#enable(0, "<bang>")
command! -nargs=0 TrimrState call trimr#show_disabled_files()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_trimr = 1

" vim: foldmethod=marker
