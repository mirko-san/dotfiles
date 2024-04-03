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

Plug 'folke/tokyonight.nvim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

set number
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,space:_

set tabstop=2
set shiftwidth=0
" tabstop に従う
set softtabstop=-1

colorscheme tokyonight

inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
