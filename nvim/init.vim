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
Plug 'tpope/vim-commentary'


" session
Plug 'mhinz/vim-startify'

Plug 'luochen1990/rainbow'

" snippet
Plug 'SirVer/ultisnips'

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

" wiki
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" easy align
Plug 'junegunn/vim-easy-align'

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

nnoremap <f1><f1> :Files<CR>
nnoremap <f1><f2> :History<CR>
nnoremap <f2><f2> :Buffers<CR>
nnoremap <f2><f3> :bn!<CR>
nnoremap <f2><f1> :bp!<CR>
nnoremap <f3><f3> :reg<CR>
nnoremap <f4><f4> <cmd>Ag<CR>
nnoremap <silent> <F2>d :bd!<CR>
nnoremap <silent> <f2>o :%bd <BAR> e # <BAR> bd #<CR>

nnoremap <F12>1 :vs ~/dotfiles/nvim/init.vim<CR>
nnoremap <F12>2 :vs ~/dotfiles/UltiSnips/all.snippets<CR>
nnoremap <F12>3 :vs ~/dotfiles/nvim/vim-include/set-vimwiki.vim<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:python3_host_prog= '/opt/homebrew/bin/python3'

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

" Easy motion
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" 화면에 힌트키가 대문자로 표시되게 한다.
" (YB 는 삭제해뒀음)
let g:EasyMotion_keys = ' ASDFQWERZXCV1235GHNTU[]567890-=,/.;IOPMLJK'
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

"* 설정 파일 include
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor
