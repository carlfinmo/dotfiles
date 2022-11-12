set number
set modeline
set cursorline
filetype plugin indent on

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"let g:ale_python_pylint_options = '--rcfile ~/.pylintrc'
let g:ale_echo_msg_format='[%linter%] [%severity%] %code% %s'

call plug#begin()

Plug 'vim-test/vim-test'
Plug 'morhetz/gruvbox'
Plug 'skywind3000/asyncrun.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Initialize plugin system
call plug#end()

let g:python3_host_prog="/home/cf/.pyenv/versions/3.8.8/bin/python"

let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"


" vim-test
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "asyncrun"

" ALE Error jumping
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Dont destroy default register
xnoremap <silent> <leader>p "_dP
nnoremap <silent> <leader>d "_dd
vnoremap <silent> <leader>d "_d

" gruvbox theme
"let g:gruvbox_termcolors=16
"let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark " Setting dark mode

