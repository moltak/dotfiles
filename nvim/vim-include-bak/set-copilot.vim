"imap <silent> <C-j> <Plug>(copilot-next)
"imap <silent> <C-k> <Plug>(copilot-previous)
"imap <silent> <C-\> <Plug>(copilot-dismiss)

imap <silent><script><expr> <CR> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true
