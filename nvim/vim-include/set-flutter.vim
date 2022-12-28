augroup vim_flutter_key_binding
" Enable Flutter menu
"call FlutterMenu()

" Some of these key choices were arbitrary;
" it's just an example.
autocmd FileType dart nnoremap s <nop>
autocmd FileType dart nnoremap sf <nop>
autocmd FileType dart nnoremap sfa :FlutterRun -d macs<cr>
autocmd FileType dart nnoremap sfq :FlutterQuit<cr>
autocmd FileType dart nnoremap sfr :FlutterHotReload<cr>
autocmd FileType dart nnoremap sfR :FlutterHotRestart<cr>
autocmd FileType dart nnoremap sfD :FlutterVisualDebug<cr>
augroup END
