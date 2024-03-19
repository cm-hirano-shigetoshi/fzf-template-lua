scriptencoding utf-8
if exists('g:load_FzfTemplateLua')
  finish
endif
let g:load_FzfTemplateLua = 1

let s:save_cpo = &cpo
set cpo&vim

nnoremap <silent> <Plug>fzf-template-lua-run :lua require('FzfTemplateLua').run("")<cr>
nnoremap <Tab>z <Plug>fzf-template-lua-run

let &cpo = s:save_cpo
unlet s:save_cpo

