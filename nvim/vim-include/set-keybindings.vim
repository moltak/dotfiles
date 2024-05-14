" source: https://github.com/johngrib/dotfiles/blob/master/nvim/vim-include/set-f1-f20.vim
"
let g:which_key_map = {}

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
nnoremap <silent> <F2>o :%bd <BAR> e # <BAR> bd #<CR>
nnoremap <f2><f3> :bn!<CR>
nnoremap <f2><f1> :bp!<CR>
"nnoremap <D-[> :bp!<CR>
"nnoremap <D-]> :bn!<CR>
"nnoremap <D-w> :bd!<CR>

let g:which_key_map.f1 = { 
      \ 'name' : '+files', 
      \ 'f1' : ['<Plug>(:Files)', 'fzf-files'],
      \ 'f2' : ['<Plug>(fzf-history)', 'fzf-history']
      \}

let g:which_key_map.f2 = { 'name' : '+buffers' }
let g:which_key_map.f2.f2 = 'buffers'
let g:which_key_map.f2.d = 'delete the selected buffer'
let g:which_key_map.f2.q = 'exit this buffer'
let g:which_key_map.f2.o = 'popup close except this buffer'

let g:which_key_map.f3 = { 'name' : '+reg' }
let g:which_key_map.f3.f3 = 'registers'

let g:which_key_map.f4 = { 'name' : '+ag' }
let g:which_key_map.f4.f4 = 'silver searcher'

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


" which_key_map
nmap sss :WhichKey 's'<CR>
nmap ss\ :WhichKey '\'<CR>

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

call which_key#register('s', "g:which_key_map")

