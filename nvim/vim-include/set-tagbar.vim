"ref: https://github.com/johngrib/dotfiles/blob/master/nvim/vim-include/set-tagbar.vim
" tagbar
nnoremap \t :TagbarToggle<CR>:e<CR>
nnoremap \\t :TagbarOpen j<CR>

let g:tagbar_type_vimwiki = {
      \ 'ctagstype' : 'vimwiki',
      \ 'sort': 0,
      \ 'kinds' : [
      \ 'h:Heading'
      \ ]
      \ }

let g:tagbar_type_asciidoc = {
      \ 'ctagstype' : 'asciidoc',
      \ 'sort': 0,
      \ 'kinds' : [
      \ 'h:Heading'
      \ ]
      \ }

let g:tagbar_type_clojure = {
      \ 'ctagstype' : 'Clojure',
      \ 'sort': 0,
      \ 'kinds' : ['n:ns', 'e:form', 'r:restUrl', 't:todo'],
      \}

"let g:tagbar_position = 'leftabove vertical'
let g:tagbar_left = 1
