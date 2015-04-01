let s:save_cpo = &cpo
set cpo&vim

if !exists('s:is_loaded')
  let s:is_loaded = 0
endif

function! trimr#exec()
  let pos = getpos('.')
  let kwd = @/
  silent execute '%' . s:get_re()
  let @/ = kwd
  call setpos('.', pos)
endfunction

function! trimr#from_to(l1, l2)
  let l:save_cursor = getpos(".")
  let kwd = @/
  silent! execute ':' . a:l1 . ',' . a:l2 . s:get_re()
  let @/ = kwd
  call setpos('.', l:save_cursor)
endfunction

function! s:get_re()
  if g:trimr_removecr
    return 's/\r$//e'
  endif
  return 's/\s\+$//e'
endfunction

function! trimr#autocmd_exec()
  if !get(g:, 'trimr_enable', 1) || !get(b:, 'trimr_enable', 1)
    return
  endif
  if !s:is_target_path(expand('%:p'))
    return
  endif
  if trimr#prefer_editorconfig()
    return
  endif

  if s:is_target_ext(expand('%:p:e'))
    call trimr#exec()
  endif
endfunction

function! trimr#prefer_editorconfig()
  if !g:trimr_prefer_editorconfig || !exists(':EditorConfigReload')
    return 0
  endif
  let cdir = expand('%:p:h')
  if !isdirectory(cdir)
    return 0
  endif
  let f = findfile(".editorconfig", cdir . ";")
  return !empty(f)
endfunction

function! trimr#enable(flag, bang)
  if strlen(a:bang)
    let g:trimr_enable = a:flag
  else
    let b:trimr_enable = a:flag
    if g:trimr_save_disable_state
      call s:storage().put(expand('%:p'), !a:flag)
    endif
  endif
endfunction

function! trimr#state_save()
  call s:storage().save()
endfunction

function! trimr#show_disabled_files()
  call s:storage().show_disabled_files()
endfunction

function! trimr#state_dump()
  call s:storage().dump()
endfunction

function! s:is_target_path(path)
  if g:trimr_save_disable_state
    return !s:storage().has(a:path)
  endif
  return 1
endfunction

function! s:is_target_ext(ext)
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

function! s:storage()
  if !s:is_loaded
    let s:instance = trimr#storage#new().init()
    let s:is_loaded = 1
  endif
  return s:instance
endfunction

let &cpo = s:save_cpo
