let s:save_cpo = &cpo
set cpo&vim

function! trimr#exec()
  let pos = getpos('.')
  silent execute '%s/\s\+$//e'
  if g:trimr_removecr
    silent execute '%s/\r$//e'
  endif
  call setpos('.', pos)
endfunction

function! trimr#autocmd_exec()
  if !get(g:, 'trimr_enable', 1) || !get(b:, 'trimr_enable', 1)
    return
  endif
  let ext = expand('%:p:e')
  if s:is_target(ext)
    call trimr#exec()
  endif
endfunction

function! trimr#enable(flag, bang)
  if strlen(a:bang)
    let g:trimr_enable = a:flag
  else
    let b:trimr_enable = a:flag
  endif
endfunction

function! s:is_target(ext)
  let search = a:ext
  let m = g:trimr_method
  let t = copy(g:trimr_targets)
  if m == 'filetype' || m == 'ignore_filetype'
    let search = &filetype
  endif
  let found = len(filter(t, 'v:val =~# search')) > 0
  if m == 'ignore_extension' || m == 'ignore_filetype'
    return !found
  endif
  return found
endfunction

let &cpo = s:save_cpo
