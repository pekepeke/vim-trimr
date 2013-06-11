let s:save_cpo = &cpo
set cpo&vim

let s:storage = { 'data': [], 'hash':{}, 'is_loaded' : 0 }

function! trimr#storage#new()
  return s:storage.new()
endfunction

function! s:storage.new()
  return extend({}, self)
endfunction

function! s:storage.load()
  if filereadable(g:trimr_save_disable_state_path)
    let self.data = readfile(g:trimr_save_disable_state_path)
    for name in self.data
      let self.hash[name] = 1
    endfor
  endif
  let self.is_loaded = 1
  return self
endfunction

function! s:storage.init()
  if (!self.is_loaded)
    call self.load()
  endif
  return self
endfunction

function! s:storage.save()
  call writefile(keys(self.hash), g:trimr_save_disable_state_path)
  return self
endfunction

function! s:storage.has(fpath)
  return exists('self.hash["'.a:fpath.'"]') && self.hash[a:fpath]
endfunction

function! s:storage.put(fpath, is_disable)
  if a:is_disable
    let self.hash[a:fpath] = 1
  elseif exists('self.hash["' . a:fpath . '"]')
    unlet self.hash[a:fpath]
  endif
  return self
endfunction

function! s:storage.dump()
  echo string(self.hash)
endfunction

function! s:storage.show_disabled_files()
  echo join(keys(self.hash), "\n")
endfunction

let &cpo = s:save_cpo
