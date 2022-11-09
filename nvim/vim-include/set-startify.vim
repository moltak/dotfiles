" reference https://github.com/johngrib/dotfiles/blob/master/nvim/vim-include/set-startify.vim
" startify
" let g:startify_custom_header = ['']

nmap \s :Startify<CR>
nmap \\s :SSave<CR>

let g:startify_update_oldfiles = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_sort = 1
let g:startify_session_persistence = 1
" let g:startify_files_number = 5
let g:startify_fortune_use_unicode = 1

let g:startify_list_order = [
      \ ['    Sessions'],
      \'sessions',
      \ ['    Most Recently Used files'],
      \'files',
      \'bookmarks',
      \ ['    Commands'],
      \'commands'
      \]

