" review.vim - GitHub Pull Request reviews from vim.
" Author:   Aliou Diallo <code@aliou.me>
" Version:  0.0.1

if exists('g:loaded_review')
  finish
endif
let g:loaded_review = 1

augroup review
  autocmd!
  " Only detect and setup stuff when Fugitive has finished setting up. This way
  " we are sure that Fugitive is present. (Unless, of course, if something else
  " sends this autocommand)
  autocmd User Fugitive call review#detect(expand('%:p'))
augroup END

" TODO: Find a way to make sure that rhubarb is also present. This should
" probably be at runtime, when calling the review command.

" TODO: Define commands only for the current buffer.
