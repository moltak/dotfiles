inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<s-tab>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <C-CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<C-CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" 아래 키는 안쓰이지만 tab을 override 하기 위해 설정
let g:UltiSnipsExpandTrigger="<C-;>"
"let g:UltiSnipsListSnippets="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:UltiSnipsExpandOrJumpTrigger="<tab>"
imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
imap <C-j> <Plug>(copilot-previous)
imap <C-k> <plug>(copilot-next)

"** 메뉴 Color
" https://github.com/neoclide/coc.nvim/pull/3862
" https://www.ditig.com/256-colors-cheat-sheet
" 자동완성메뉴에서 현재 선택된 아이템
highlight CocMenuSel ctermbg=88 guibg=#870000

" 자동완성메뉴에서 매치된 글자
highlight CocSearch ctermfg=10 guifg=#00ff00

" 자동완성메뉴에서 선택되지 않은 아이템들
highlight CocFloating ctermbg=237 guibg=#3a3a3a


" COC extension
let g:coc_global_extensions = [
            \ 'coc-ultisnips',
            \ 'coc-snippets',
            \ 'coc-explorer',
            \ 'coc-tsserver',
            \ 'coc-json',
            \ 'coc-clangd',
            \ 'coc-copilot'
            \]

" coc_explorer
let g:coc_explorer_global_presets = {
      \   '.vim': {
      \     'root-uri': '~/.vim',
      \   },
      \   'cocConfig': {
      \      'root-uri': '~/.config/coc',
      \   },
      \   'tab': {
      \     'position': 'tab',
      \     'quit-on-open': v:true,
      \     'width': 25
      \   },
      \   'tab:$': {
      \     'position': 'tab:$',
      \     'quit-on-open': v:true,
      \     'width': 25
      \   },
      \   'floating': {
      \     'position': 'floating',
      \     'open-action-strategy': 'sourceWindow',
      \   },
      \   'floatingTop': {
      \     'position': 'floating',
      \     'floating-position': 'center-top',
      \     'open-action-strategy': 'sourceWindow',
      \   },
      \   'floatingLeftside': {
      \     'position': 'floating',
      \     'floating-position': 'left-center',
      \     'floating-width': 50,
      \     'open-action-strategy': 'sourceWindow',
      \   },
      \   'floatingRightside': {
      \     'position': 'floating',
      \     'floating-position': 'right-center',
      \     'floating-width': 50,
      \     'open-action-strategy': 'sourceWindow',
      \   },
      \   'simplify': {
      \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
      \   },
      \   'buffer': {
      \     'sources': [{'name': 'buffer', 'expand': v:true}]
      \   },
      \ }

" Use preset argument to open it
nnoremap <C-n> <Cmd>CocCommand explorer --preset floatingLeftside<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)

