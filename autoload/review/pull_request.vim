" TODO: List pull request and allow choice when there are multiples.
function! review#pull_request#get_number() abort
  let l:branch_name = fugitive#repo().head()
  let l:query = s:url_encode('state=open head=' . l:branch_name)
  let l:repo = review#repo()
  let l:path = review#utils#query_replace('/repos/:owner/:name/pulls?', l:repo) . l:query
  let l:response = rhubarb#request(l:path)

  if len(l:response) == 0
    throw s:throw('No open pull requests')
  endif

  return l:response[0].number
endfunction

function! s:throw(string) abort
  let v:errmsg = 'review.vim: '.a:string
  throw v:errmsg
endfunction

function! s:url_encode(str) abort
  return substitute(a:str, '[?@=&<>%#/:+[:space:]]', '\=submatch(0)==" "?"+":printf("%%%02X", char2nr(submatch(0)))', 'g')
endfunction
