function! review#utils#query_replace(query, param_values)
  let l:params = map(filter(split(a:query, '/'), "match(v:val, '^:') != -1"),
        \ "substitute(v:val, ':', '', '')")

  let l:query = a:query
  for l:param in l:params
    let l:query = substitute(l:query, ':' . l:param, a:param_values[l:param], '')
  endfor

  return l:query
endfunction
