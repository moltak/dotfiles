"
" https://github.com/neoclide/coc.nvim#example-vim-configuration

augroup vim_typescript_coc

set updatetime=300

autocmd FileType typescript nmap s <nop>
autocmd FileType typescript nmap sa <nop>

  " Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nnoremap <silent> sadh <Plug>(coc-diagnostic-prev)
nnoremap <silent> sadl <Plug>(coc-diagnostic-next)

nnoremap <silent> sadi :CocFzfList diagnostics<CR>

" Remap keys for applying codeAction to the current line.
nmap saa  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap saf  <Plug>(coc-fix-current)

" codeaction
nmap <silent> sar  <Plug>(coc-codeaction-refactor)
xmap <silent> sars <Plug>(coc-codeaction-refactor-selected)
nmap <silent> sars <Plug>(coc-codeaction-refactor-selected)

nmap srn <Plug>(coc-rename)

" Formatting selected code
xmap saf  <Plug>(coc-format-selected)
nmap saf  <Plug>(coc-format-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> saK :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup END
