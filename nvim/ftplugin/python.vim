nnoremap <C-b> obreakpoint()<ESC>:w!<CR>
inoremap <C-b> breakpoint()<CR>
nnoremap <C-S-B> :%s/.*breakpoint().*\n//g<cr>
