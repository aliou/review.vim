" https://developer.github.com/v3/pulls/comments/#create-a-comment
function! review#comment#create(body, commit_id, path, position) abort
  let l:data = {
        \   'body': a:body,
        \   'commit_id': a:commit_id,
        \   'path': a:path,
        \   'position': a:position
        \ }

  let l:repo = review#repo()
  let l:pr_number = review#pr_number()
  let l:path = review#utils#query_replace(
        \   '/repos/:owner/:repo/pulls/:number/comments',
        \   extend(l:repo, { 'number': l:pr_number })
        \ )
  let l:options = {
        \   'method': 'post',
        \   'data': l:data,
        \ }
  let l:response = rhubarb#request(l:path, l:options)
  let l:res = json_encode(l:response)

  return l:res
endfunction
