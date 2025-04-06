call plug#begin('~/.vim/plugged')
" wiki
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ctrlpvim/ctrlp.vim' " file buffer search

" tpope
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-commentary'

" session
Plug 'mhinz/vim-startify'

Plug 'luochen1990/rainbow'

" snippet
Plug 'SirVer/ultisnips'

" tags
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'preservim/tagbar'

" theme
Plug 'morhetz/gruvbox'

" chrome vim extension 처럼 커서 이동
Plug 'easymotion/vim-easymotion'

" vim notify
Plug 'rcarriga/nvim-notify'

Plug 'kamykn/popup-menu.nvim'

" Window
  " m mark 위치를 표시해준다.
  Plug 'kshenoy/vim-signature' 

  " vim window resize
  Plug 'simeji/winresizer'

" All the lua functions I don't want to write twice.
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
"Plug 'fannheyward/telescope-coc.nvim'

"Edit
  " easy align
  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/vim-xmark', { 'do': 'make' }


" diff
Plug 'sindrets/diffview.nvim'

Plug 'nvim-tree/nvim-web-devicons'

" copilot
Plug 'github/copilot.vim'

Plug 'liuchengxu/vim-which-key'

" ruby
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

Plug 'christoomey/vim-tmux-navigator'

" JS
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'

call plug#end()

set rtp+=~/dotfiles/nvim

"* 설정 파일 include
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor

"colorscheme evening
"colorscheme flatcolor-johngrib
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

" easyalign
xmap =f <Plug>(EasyAlign)
nmap =f <Plug>(EasyAlign)

let g:python3_host_prog = "/usr/local/bin/python3"

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

" rainbow
let g:rainbow_active = 1

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

let g:tagbar_ctags_bin = "/opt/homebrew/bin/ctags"

" repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:coc_node_path = "/usr/local/bin/node"
