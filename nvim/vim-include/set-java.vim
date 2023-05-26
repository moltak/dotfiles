" start the mvn build in a tmux pane with debug flag an the current buffer as filter parameter 
" [vimux](https://github.com/benmills/vimux) is a plugin for tmux user to interact better between tmux and vim
" I just use it to kick of my maven build in debugmode with the actual Testclass
noremap <leader>ds :VimuxRunCommand "mvn -Dmaven.surefire.debug  -Dtest=".expand("%:t:r")." test --offline"<CR>

" runs mvn test with the current buffer name a filter parameter.  
noremap <leader>rs :call RunMvnThisTest(expand("%:t:r"))<CR>

" runs all tests, but catch the output and open a new buffer with the result of the mvn build
noremap <leader>rS :call RunMvnTest()<CR>


" Organize import 
augroup vim_clojure_coc
    autocmd FileType java nmap <silent> snS :call CocAction('organizeImport')<CR>
augroup END
