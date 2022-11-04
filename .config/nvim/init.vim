call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'

" One of following
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Requires
Plug 'guns/vim-sexp',    {'for': 'clojure'}
Plug 'liquidz/vim-iced', {'for': 'clojure'}
Plug 'liquidz/vim-iced-coc-source', {'for': 'clojure'}

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'} " 자꾸 coc가 멈춰서..


" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim' " file buffer search
Plug 'tpope/vim-fugitive' " git command

" 비활성 윈도우 강조
"Plug 'blueyed/vim-diminactive'

" tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" session
Plug 'mhinz/vim-startify'

Plug 'luochen1990/rainbow'

" snippet
"Plug 'SirVer/ultisnips'

" tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

" theme
Plug 'morhetz/gruvbox'

" chrome vim extension 처럼 커서 이동
Plug 'easymotion/vim-easymotion'

" vim notify
Plug 'rcarriga/nvim-notify'

Plug 'kamykn/popup-menu.nvim'

" m mark 위치를 표시해준다.
Plug 'kshenoy/vim-signature' 

" vim window resize
Plug 'simeji/winresizer'

" image.vim
Plug 'samodostal/image.nvim'
Plug 'nvim-lua/plenary.nvim'
call plug#end()

colorscheme gruvbox

set nu
set tabstop=2
set shiftwidth=2
set expandtab
set nobackup nowritebackup
set wildmenu wildignorecase
set wildmode=full
set ignorecase
set noswapfile
set nobackup
set splitright
set clipboard=unnamed
set complete?
set termguicolors
set langmap=ㅁa,ㅠb,ㅊc,ㅇd,ㄷe,ㄹf,ㅎg,ㅗh,ㅑi,ㅓj,ㅏk,ㅣl,ㅡm,ㅜn,ㅐo,ㅔp,ㅂq,ㄱr,ㄴs,ㅅt,ㅕu,ㅍv,ㅈw,ㅌx,ㅛy,ㅋz
set wrap
set cursorline
set cursorcolumn

let g:coc_global_extensions = ['coc-clojure']
" let g:iced#nrepl#enable_sideloader = v:true
" REPL을 오른쪽에 열어준다
let g:iced#buffer#stdout#mods = 'vertical'
let g:iced#buffer#stdout#size = v:null

let g:iced#nrepl#skip_evaluation_when_buffer_size_is_exceeded = v:true

" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:false

"* coc 설정
augroup vim_clojure_coc
    autocmd FileType clojure nmap <silent> s<C-]> <Plug>(coc-definition)
    autocmd FileType clojure nmap <silent> <C-]> :IcedDefJump<CR>
    autocmd FileType clojure nmap <silent> gy <Plug>(coc-type-definition)
    " autocmd VimLeavePre clojure TagbarClose
augroup END

augroup vim_clojure_key_binding
  " Jack In을 수행한다
  function! s:jack_in(selected)
    call Noti_pipe(v:null, 'REPL을 시작합니다.')
    if a:selected == ' 직접입력'
      let l:options = input('options: ', '-A:dev:itest:test')
    else
      let l:options = a:selected
    endif
    let g:iced#nrepl#connect#jack_in_command = g:iced#nrepl#connect#iced_command . ' repl ' . l:options
    IcedJackIn
  endfunction

  " REPL: - "sr"
  autocmd FileType clojure nmap sss :IcedCommandPalette<CR>

  autocmd FileType clojure nmap s <nop>
  autocmd FileType clojure nmap sr <nop>
  autocmd FileType clojure nmap srr <Plug>(iced_stdout_buffer_toggle)
  autocmd FileType clojure nmap srb <C-w>J10<C-w>-
  autocmd FileType clojure nmap srd <Plug>(iced_stdout_buffer_clear)
  autocmd FileType clojure nmap src <Plug>(iced_connect)
  autocmd FileType clojure nmap sri <Plug>(iced_interrupt)
  autocmd FileType clojure nmap srp <Plug>(iced_print_last)

  autocmd FileType clojure nmap srj :call popup_menu#open([' ', ' -A:dev:itest:test', ' 직접입력'], {selected -> <SID>jack_in(selected)})<CR>


  " Eval Code: - "se"
  "  (defn greet [] (println "hello world"))
  "                           <--inner-->
  "                 <-----outer_list------>
  "  <-----------outer_top_list------------>
  autocmd FileType clojure nmap se <nop>
  autocmd FileType clojure vmap se <Plug>(iced_eval_visual)

  "autocmd FileType clojure nmap s? :vs ~/dotfiles/nvim/vim-include/set-clojure.vim<CR>
  autocmd FileType clojure nmap s? :vs ~/.config/nvim/init.vim<CR>
  autocmd FileType clojure nmap see <Plug>(iced_eval_and_print)<Plug>(sexp_outer_list)``
  autocmd FileType clojure nmap sew <Plug>(iced_eval_and_print)<Plug>(sexp_inner_element)``
  autocmd FileType clojure nmap ser <Plug>(iced_eval_and_print)<Plug>(sexp_outer_top_list)``
  autocmd FileType clojure nmap sef :IcedRequire<CR>:echom "file loaded:" expand("%")<CR>
  autocmd FileType clojure nmap seF :IcedRequireAll<CR>:echom "Require and reload current file."<CR>
  autocmd FileType clojure nmap sea :IcedRefresh<CR>:echom "Reload all changed files on the classpath."<CR>
  autocmd FileType clojure nmap seA :IcedRefreshAll<CR>:echom "Reload all files on the classpath."<CR>
  autocmd FileType clojure nmap seu <Plug>(iced_undef_all_in_ns)
  autocmd FileType clojure nmap se' <Plug>(iced_eval_at_mark)
  autocmd FileType clojure nmap sem <Plug>(iced_eval_at_mark)
  autocmd FileType clojure nmap sec <Plug>(iced_eval_and_comment)

  " Testing: - "st"
  autocmd FileType clojure nmap <silent> stc :call CocAction('runCommand', 'lsp-clojure-create-test')<CR>
  autocmd FileType clojure nmap st' <Plug>(iced_cycle_src_and_test)
  autocmd FileType clojure nmap stt :IcedTestUnderCursor<CR>
  " Run tests in current namespace.
  autocmd FileType clojure nmap stn :IcedTestNs<CR>
  " Run all tests in current project.
  autocmd FileType clojure nmap sta :IcedTestAll<CR>
  " Re run failed tests.
  autocmd FileType clojure nmap str :IcedTestRedo<CR>
  " Run last test again.
  autocmd FileType clojure nmap st. :IcedTestRerunLast<CR>
  " 아직 필요를 못 느낌
  " :IcedTestSpecCheck
  "

  " Code Analyse: - "sa"
  autocmd FileType clojure nmap sa <nop>
  autocmd FileType clojure nmap sar :IcedBrowseReferences<CR>
  autocmd FileType clojure nmap saR <Plug>(coc-references)
  autocmd FileType clojure nmap sad :IcedBrowseDependencies<CR>
  autocmd FileType clojure nmap sau :IcedUseCaseOpen<CR>:echom "list use case: gF to open file"<CR>
  autocmd FileType clojure nmap sa/ <Plug>(iced_grep)
  autocmd FileType clojure nmap sam <Plug>(iced_macroexpand_1_outer_list)
  autocmd FileType clojure nmap saM <Plug>(iced_macroexpand_outer_list)
  autocmd FileType clojure nmap sap <Plug>(iced_document_popup_open)
  autocmd FileType clojure nmap saP <Plug>(iced_clojuredocs_popup_open)
  autocmd FileType clojure nmap sak <Plug>(iced_document_open)
  autocmd FileType clojure nmap saK <Plug>(iced_clojuredocs_open)
  autocmd FileType clojure nmap sas :IcedSourcePopupShow<CR>
  autocmd FileType clojure nmap saS :IcedSourceShow<CR>
  autocmd FileType clojure nmap <silent> sai <Plug>(coc-implementation)

  " autocmd FileType clojure nmap sal :make<CR>:copen<CR>
  autocmd FileType clojure nmap sal :Dispatch<CR>
  autocmd FileType clojure setlocal makeprg=clj-kondo\ --lint\ %
  autocmd FileType clojure setlocal errorformat=%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m

  " Clj Kondo: - "sk" - https://github.com/clj-kondo/clj-kondo
  " clj kondo를 파일에 대해 실행하고, 경고 목록을 보여줌. sal 과 같다.
  autocmd FileType clojure nmap skl :Dispatch<CR>
  " .clj-kondo/config.edn 에 매크로를 등록해서 인식하게 해준다.
  autocmd FileType clojure nmap skm :call CocAction('runCommand', 'lsp-clojure-resolve-macro-as')<CR>
  " .clj-kondo/ignore 를 추가해서 경고를 끈다.
  autocmd FileType clojure nmap sks i#_:clj-kondo/ignore<ESC>
  " ↓ 작동안함. 이유를 모르겠음.
  " autocmd FileType clojure nmap sks :call CocAction('runCommand', 'lsp-clojure-suppress-diagnostic')<CR>

  " code menu
  autocmd FileType clojure nmap scm :call CocAction('codeAction', 'cursor')<CR>

  " Name Space: - "sn"
  autocmd FileType clojure nmap sna :IcedAddNs<CR>
  autocmd FileType clojure nmap sns :call <SID>sort_clojure_namspace_require()<CR>
  function! s:sort_clojure_namspace_require()
      if input("namespace require list를 정렬하시겠습니까? (y/n) ") =~ "y"
          execute "normal! gg/:require \nea\n\n/))\ni\n\nggvip}10</[\nvip:sort\nkkJJ}kJJvip="
      endif
  endfunction
  function! s:sort_clojure_namspace_require2()
      if input("namespace require list를 정렬하시겠습니까? (y/n) ") =~ "y"
          execute "normal! gg/:require ea/))iggvip}10</[vip:sortkkJJ}kJJvip="
      endif
  endfunction
  autocmd FileType clojure nmap snS :call system("clojure-lsp clean-ns --settings '{:clean {:ns-inner-blocks-indentation :same-line :sort {:ns true :require true :import true :refer {:max-line-length 80}}}}' --filenames " . expand("%"))<CR>:e<CR>

  autocmd FileType clojure nmap snc :IcedCleanNs<CR>
  " 왜 안되는지 모르겠음.. 그리고 어떻게 쓰는지 모르겠음
  " autocmd FileType clojure nmap <silent> snA :call CocAction('runCommand', 'lsp-clojure-add-require-suggestion')<CR>

  autocmd FileType clojure nmap sff <Plug>(coc-codeaction-cursor)

  " Code Typing: - "sc"
  autocmd FileType clojure nmap sc <nop>
  autocmd FileType clojure nmap scn :call CocAction('refactor')<CR>
  autocmd FileType clojure nmap scR :IcedRenameSymbol<CR>
  autocmd FileType clojure nmap scr <Plug>(coc-rename)
  " 잘되지만 lsp-clojure-change-coll 이 좀 더 편함
  " autocmd FileType clojure nmap <silent> scc :call CocAction('runCommand', 'lsp-clojure-cycle-coll')<CR>
  autocmd FileType clojure nmap <silent> scc :call CocAction('runCommand', 'lsp-clojure-change-coll')<CR>
  autocmd FileType clojure nmap <silent> scf :call CocAction('runCommand', 'lsp-clojure-create-function')<CR>
  " 커서가 위치한 단어를 복사해서 아랫줄에 _ (println 단어)를 만들어 준다. let 구문에서 사용할 것.
  autocmd FileType clojure nmap scp yiwo_<Space>(println "<C-r>":" <C-r>")<Esc>
  autocmd FileType clojure nmap sc# <Plug>(sexp_move_to_prev_bracket)i#_<Esc>``
  autocmd FileType clojure nmap sc3 <Plug>(sexp_move_to_prev_element_head)i#_<Esc>l
  autocmd FileType clojure nmap scl :IcedMoveToLet<CR>
  autocmd FileType clojure nmap sc> :IcedThread


augroup END

"* REPL 연결 hook 설정
let g:iced#hook = {
      \ 'connect_prepared': {
      \ 'type': 'function',
      \ 'exec': {params -> Noti_pipe(params, 'REPL 연결을 시도합니다.')}},
      \ 'connecting': {
      \ 'type': 'function',
      \ 'exec': {params -> Noti_pipe(params, 'REPL에 연결중입니다.')}},
      \ 'connected': {
      \ 'type': 'function',
      \ 'exec': {params -> Noti_pipe(params, 'REPL에 연결되었습니다.')}},
      \}

"** 메뉴 Color
" https://github.com/neoclide/coc.nvim/pull/3862
" https://www.ditig.com/256-colors-cheat-sheet
" coc 자동완성메뉴에서 현재 선택된 아이템
highlight CocMenuSel ctermbg=88 guibg=#870000

" coc 자동완성메뉴에서 매치된 글자
highlight CocSearch ctermfg=10 guifg=#00ff00

" coc 자동완성메뉴에서 선택되지 않은 아이템들
highlight CocFloating ctermbg=237 guibg=#3a3a3a


" 편집한 값들은 한 단계 인덴트를 오른쪽으로 당겼음
let g:sexp_mappings = {
      \ 'sexp_outer_list':                'af',
      \ 'sexp_inner_list':                'if',
      \ 'sexp_outer_top_list':            'aF',
      \ 'sexp_inner_top_list':            'iF',
      \ 'sexp_outer_string':              '',
      \ 'sexp_inner_string':              '',
      \ 'sexp_outer_element':             'ae',
      \ 'sexp_inner_element':             'ie',
      \ 'sexp_move_to_prev_bracket':      '(',
      \ 'sexp_move_to_next_bracket':      ')',
      \ 'sexp_move_to_prev_element_head': 'B',
      \ 'sexp_move_to_next_element_head': 'W',
      \ 'sexp_move_to_prev_element_tail': 'gE',
      \ 'sexp_move_to_next_element_tail': 'E',
      \ 'sexp_flow_to_prev_close':        '',
      \ 'sexp_flow_to_next_open':         '',
      \ 'sexp_flow_to_prev_open':         '',
      \ 'sexp_flow_to_next_close':        '',
      \ 'sexp_flow_to_prev_leaf_head':    '',
      \ 'sexp_flow_to_next_leaf_head':    '',
      \ 'sexp_flow_to_prev_leaf_tail':    '',
      \ 'sexp_flow_to_next_leaf_tail':    '',
      \ 'sexp_move_to_prev_top_element':  '[[',
      \ 'sexp_move_to_next_top_element':  ']]',
      \ 'sexp_select_prev_element':       '[v',
      \ 'sexp_select_next_element':       ']v',
      \ 'sexp_indent':                    '==',
      \ 'sexp_indent_top':                '=-',
      \ 'sexp_round_head_wrap_list':      'sw(',
      \ 'sexp_round_tail_wrap_list':      'sw)',
      \ 'sexp_square_head_wrap_list':     'sw[',
      \ 'sexp_square_tail_wrap_list':     'sw]',
      \ 'sexp_curly_head_wrap_list':      'sw{',
      \ 'sexp_curly_tail_wrap_list':      'sw}',
      \ 'sexp_round_head_wrap_element':   'swe(',
      \ 'sexp_round_tail_wrap_element':   'swe)',
      \ 'sexp_square_head_wrap_element':  'swe[',
      \ 'sexp_square_tail_wrap_element':  'swe]',
      \ 'sexp_curly_head_wrap_element':   'swe{',
      \ 'sexp_curly_tail_wrap_element':   'swe}',
      \ }


" convolute - https://stackoverflow.com/a/18192105
"                             v
" from: (let [foo bar] (if a b c)) 
" to  : (if a b (let [foo bar] c))
let g:sexp_mappings.sexp_convolute = 'swc'
" 부모 form 삭제
"                            v
" from: (let [foo bar] (if a b c)) 
" to  : (if a b c) 
let g:sexp_mappings.sexp_raise_list = 'dsp'
" 형제 element 모두 삭제하고 혼자 남게 됨
"                            v
" from: (let [foo bar] (if a b c)) 
" to  : (let [foo bar] b) 
let g:sexp_mappings.sexp_raise_element = 'dso'

" vim-airline 설정
let g:airline_theme = 'jellybeans'
" @link http://bakyeono.net/post/2015-08-13-vim-tab-madness-translate.html
let g:airline#extensions#tabline#enabled = 1     " vim-airline 버퍼 목록 켜기
let g:airline#extensions#tabline#fnamemod = ':t' " vim-airline 버퍼 목록 파일명만 출력
let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer number 를 보여준다
let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" startify
" let g:startify_custom_header = ['']
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
      \     'floating-width': 30,
      \     'open-action-strategy': 'sourceWindow',
      \   },
      \   'floatingRightside': {
      \     'position': 'floating',
      \     'floating-position': 'right-center',
      \     'floating-width': 30,
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
nnoremap <C-n> <Cmd>CocCommand explorer<CR>
nmap <space>ef <Cmd>CocCommand explorer --preset floating<CR>
nmap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
nmap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>

" List all presets
nmap <space>el <Cmd>CocList explPresets<CR>


" fzf
nnoremap <f1><f1> :Files<CR>
nnoremap <f1><f2> :History<CR>
nnoremap <f2><f2> :Buffers<CR>
nnoremap <f2><f3> :bn!<CR>
nnoremap <f2><f1> :bp!<CR>
nnoremap <f3><f3> :reg<CR>
nnoremap <silent> <F2>d :bd!<CR>
" 현재 버퍼를 닫고 이전 버퍼로 이동
"nnoremap <silent> <F9><F6>      :bp <BAR> bd #<CR>
"nnoremap <silent> <F9>q      :bp <BAR> bd #<CR>
"nnoremap <silent> <F9><F9>  :Buffers<CR>
" 현재 버퍼만 남기고 모두 닫기
nnoremap <silent> <f2>o :%bd <BAR> e # <BAR> bd #<CR>

nnoremap <F10>r :source ~/.vimrc<CR>

" rainbow
let g:rainbow_active = 1


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


" gruvbox theme
let g:gruvbox_contrast_dark="hard"
set background=dark
"autocmd vimenter * colorscheme gruvbox


augroup cursor_move_selected_word
    " :so $VIMRUNTIME/syntax/hitest.vim
    autocmd CursorMoved * exe printf('match CursorSelected001 /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    highlight CursorSelected001 ctermfg=14 ctermbg=23 guifg=#00ffff guibg=#005f5f
    highlight MatchParen ctermbg=red guibg=#8c709a
augroup END


" Easy motion
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" 화면에 힌트키가 대문자로 표시되게 한다.
" (YB 는 삭제해뒀음)
let g:EasyMotion_keys = ' ASDFQWERZXCV1234GHNTU[]567890-=,/.;IOPMLJK'
let g:EasyMotion_use_upper = 1

nmap <c-s> [easymotion-p]
vmap <c-s> [easymotion-p]

nmap [easymotion-p]<c-s> <Plug>(easymotion-overwin-line)

" INSERT 모드에서 입력하면 해당 라인 내에서 좌우로 이동 가능
imap <c-s> <c-o><Plug>(easymotion-lineanywhere)

nmap [easymotion-p]2 <Plug>(easymotion-overwin-f2)

" easymotion + hjkl
nmap [easymotion-p]l <Plug>(easymotion-lineforward)
vmap [easymotion-p]l <Plug>(easymotion-lineforward)
nmap [easymotion-p]j <Plug>(easymotion-j)
vmap [easymotion-p]j <Plug>(easymotion-j)
nmap [easymotion-p]k <Plug>(easymotion-k)
vmap [easymotion-p]k <Plug>(easymotion-k)
nmap [easymotion-p]h <Plug>(easymotion-linebackward)
vmap [easymotion-p]h <Plug>(easymotion-linebackward)

nmap [easymotion-p]a <Plug>(easymotion-jumptoanywhere)
vmap [easymotion-p]a <Plug>(easymotion-jumptoanywhere)
nmap [easymotion-p]w <Plug>(easymotion-overwin-w)
nmap [easymotion-p]f <Plug>(easymotion-overwin-f)
nmap [easymotion-p]/ <Plug>(easymotion-sn)

" Smartsign (`3`을 입력하면 `3`과 `#`에 매치됨)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1


lua << EOF
vim.notify = require('notify')

function _G.noti_custom_text(text)
    vim.notify(text, vim.log.levels.INFO, {
        stages = 'slide',
        render = 'minimal',
    })
end
EOF

function! Noti_pipe(param, text)
    call v:lua.noti_custom_text(a:text)
    return a:param
endfunction



lua << EOF
require('image').setup {
  render = {
    min_padding = 5,
    show_label = true,
    use_dither = true,
    foreground_color = false,
    background_color = false
  },
  events = {
    update_on_nvim_resize = true,
  },
}
EOF
