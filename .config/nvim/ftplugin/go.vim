"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
nmap <leader>r  <Plug>(go-run)
nmap <leader>b  <Plug>(go-build)
nmap <Leader>C <Plug>(go-coverage-toggle)
nmap <Leader>c <Plug>(go-coverage)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>d <Plug>(go-def)
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

set noexpandtab tabstop=4 shiftwidth=4

command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
