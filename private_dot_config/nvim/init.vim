call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lambdalisue/fern.vim'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

let g:coc_global_extensions = [
  \  'coc-rust-analyzer'
  \, 'coc-tsserver'
  \, 'coc-json'
  \, ]

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

syntax enable
filetype plugin indent on

set number
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,space:_

set tabstop=2
set shiftwidth=0
" tabstop に従う
set softtabstop=-1

colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>

""" Fern
" Show hidden files
let g:fern#default_hidden=1

" Show file tree with Ctrl+n
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

