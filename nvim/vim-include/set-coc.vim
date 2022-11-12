"ref: https://github.com/johngrib/dotfiles/blob/master/nvim/vim-include/set-coc.vim
"
"
inoremap <silent><expr> <c-space> coc#refresh()


" COC extension
let g:coc_global_extensions = [
            \ 'coc-ultisnips',
            \ 'coc-snippets',
            \ 'coc-explorer',
            \]

" 팝업 메뉴가 보인다면 coc 자동완성
" 커서 왼쪽에 공백 문자가 있다면 그냥 탭 키 입력
" 그 외의 경우에는 UltiSnips 자동완성
inoremap <silent><script><expr> <TAB>
      \ coc#pum#visible()
      \ ? coc#pum#confirm()
      \ : <SID>check_back_space() ? "\<TAB>"
      \ : "\<C-R>=UltiSnips#ExpandSnippet()<CR>"

"** 메뉴 Color
" https://github.com/neoclide/coc.nvim/pull/3862
" https://www.ditig.com/256-colors-cheat-sheet
" coc 자동완성메뉴에서 현재 선택된 아이템
highlight CocMenuSel ctermbg=88 guibg=#870000

" coc 자동완성메뉴에서 매치된 글자
highlight CocSearch ctermfg=10 guifg=#00ff00

" coc 자동완성메뉴에서 선택되지 않은 아이템들
highlight CocFloating ctermbg=237 guibg=#3a3a3a

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
"nmap <space>ed <Cmd>CocCommand explorer --preset .vim<CR>
"nnoremap <C-n> <Cmd>CocCommand explorer<CR>
nnoremap <D-e> <Cmd>CocCommand explorer --preset floatingLeftside<CR>
"nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
"nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>


" coc nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

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

