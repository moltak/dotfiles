"refer: https://github.com/johngrib/dotfiles/blob/master/nvim/vim-include/set-clojure.vim:
"* Clojure 설정파일

" https://liquidz.github.io/vim-iced/#cheatsheet
" REPL 띄우고 vim에서 접속하려면
" $ iced repl -A:dev
" $ iced repl -A:dev:test:itest
" $ iced repl -A:migration

if exists("g:loaded_clojure_setting") || &cp
  finish
endif
let g:loaded_clojure_setting = 1

"* tagbar 설정
let g:tagbar_type_clojure = {
    \ 'ctagstype' : 'Clojure',
    \ 'sort': 0,
    \ 'kinds' : ['n:ns', 'e:form', 't:ToDo'],
    \}

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
  autocmd FileType clojure nmap s? :vs ~/dotfiles/.config/nvim/vim-include/set-clojure.vim<CR>
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

  " =
  autocmd FileType clojure nmap == <Plug>(iced_format)
  " https://github.com/junegunn/vim-easy-align/issues/115#issuecomment-325899234
  autocmd FileType clojure nnoremap =[ vi[<c-v>$:EasyAlign\ g/^\S/<cr>gv=
  autocmd FileType clojure nnoremap ={ vi{<c-v>$:EasyAlign\ g/^\S/<cr>gv=


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
