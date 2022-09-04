let g:rustfmt_autosave = 1

let g:ale_fixers = { 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'] }

"let g:ale_linters.rust = ['cargo', 'rls']
let g:ale_rust_rls_toolchain = 'stable'

let g:ale_linters = {'rust': ['analyzer']}

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

set completeopt=menu,menuone,preview,noselect,noinsert

nnoremap <Leader>d :ALEGoToDefinition<CR>

"let g:ale_floating_preview = 1
