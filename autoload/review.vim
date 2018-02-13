function! review#repo() abort
  let l:homepage = rhubarb#homepage_for_url(fugitive#repo().config('remote.origin.url'))
  let [l:owner, l:name] = split(l:homepage, '/')[-2:-1]

  return {'owner': l:owner, 'name': l:name}
endfunction

function! review#detect(filename) abort
endfunction
