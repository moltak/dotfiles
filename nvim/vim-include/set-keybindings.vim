" source: https://github.com/johngrib/dotfiles/blob/master/nvim/vim-include/set-f1-f20.vim
"

" f1 - f2
nnoremap <f1><f1> :Files<CR>
nnoremap <f1><f2> :History<CR>
nnoremap <f2><f2> :Buffers<CR>
nnoremap <f3><f3> :reg<CR>
nnoremap <f4><f4> :Ag<CR>
nnoremap <f2>s    :Lines <CR>

" buffer
nnoremap <silent> <F2>d :BuffersDelete<CR>
nnoremap <silent> <F2>q :bp <BAR> bd #<Enter>
nnoremap <silent> <f2>o :%bd <BAR> e # <BAR> bd #<CR>
nnoremap <f2><f3> :bn!<CR>
nnoremap <f2><f1> :bp!<CR>
"nnoremap <D-[> :bp!<CR>
"nnoremap <D-]> :bn!<CR>
"nnoremap <D-w> :bd!<CR>

" split
"nnoremap <D-\> :vs<CR>
"nnoremap sos :vs<CR>

" 
nnoremap som :Marks<CR>
nnoremap sos :Snippets<CR>
nnoremap soc :Commits<CR>
nnoremap \s  :Tags <CR>

" https://www.reddit.com/r/neovim/comments/mlqyca/fzf_buffer_delete/
function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bd! ' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BuffersDelete call fzf#run(fzf#wrap({
            \ 'source': s:list_buffers(),
            \ 'sink*': { lines -> s:delete_buffers(lines) },
            \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept' }))

" f12
nnoremap <F12>vim :vs ~/dotfiles/nvim/init.vim<CR>

"" 도움말 사용안함.
nnoremap <F1> <CR> 

" special order something
nmap s <nop>
nmap so <nop>
nmap sot :VimuxPromptCommand<CR>
