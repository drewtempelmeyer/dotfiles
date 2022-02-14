set t_ut=
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

" Install VimPlug if not present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

let mapleader="," " Change <leader> to ,

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/plugin-config.vim

"Use 24-bit (true-color) mode in Vim/Neovim
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if has('nvim') || has('termguicolors')
  set termguicolors
endif

" Colorscheme
set background=dark
colorscheme palenight

set mouse=a
set nocursorline                " Don't highlight the current line
set lazyredraw                  " Faster scrolling
set number                      " Show line number
set relativenumber              " Show relative line number
set showcmd                     " Show current command
set showmode                    " Show current mode
set wildmode=longest:list,full  " Autocomplete
set wildignore=*.o,*.obj,*~     " Ignore file
set showmatch                   " highlight matching braces
set hlsearch                    " Highlight search
set ignorecase                  " ignore case while searching
set smartcase                   " unless uppercase explicitly mentioned
set smartindent                 " indent smartly
set nowrap                      " Don't wrap text
set laststatus=2                " Always show statusbar
set scrolloff=5                 " Minimum space on bottom/top of window
set sidescrolloff=7             " Minimum space on side
set sidescroll=1
set list                        " Display hidden chars as defined below
set listchars=tab:▷⋅,trail:⋅,nbsp:+,extends:»,precedes:«
set splitright                  " Open vsp on right
set pastetoggle=<F2>
set noshowmode                  " Hide mode (lightline shows mode)
set expandtab                   " Spaces > tabs
set tabstop=2                   " 2 spaces
set shiftwidth=2                " 2 2 CHAINZ
set nofoldenable                " Disable folding
set clipboard+=unnamedplus      " Use system clipboard

""" Undo settings
set undodir=~/.vim-undo
set undofile
set undolevels=1000  "max number of changes that can be undone
set undoreload=10000 "max number lines to save for undo on buffer reload

" syntax sync minlines=256  " Makes big files slow
" set synmaxcol=2048        " Also long lines are slow

" Use old regexp engine
" This speeds up Ruby syntax highlighting
set regexpengine=1

" Filetype specific settings
autocmd! filetype *commit*,markdown setlocal spell         " Spell Check
autocmd! filetype *commit*,markdown setlocal textwidth=80  " Looks good
autocmd! filetype make setlocal noexpandtab                " In Makefiles DO NOT use spaces instead of tabs

autocmd BufWritePre * call TrimWhitespace() " Remove trailing whitespace when saving
autocmd! BufReadPost * call SetCursorPosition()

autocmd BufWritePost *.rb silent! execute "!ripper-tags -R --exclude=vendor >/dev/null 2>&1" | redraw!

nmap <silent> <leader>r :silent execute "!rubocop -A %"<CR>

set ff=unix

" Move lines up(-) or down(_)
noremap - ddp
noremap _ ddkP
" Write file as sudo
cnoremap w!! w !sudo tee > /dev/null %

" Use Ctrl+H,J,K,L to navigate panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Organize go imports
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" Trims trailing whitespace
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

" Function to set cursor postion
function! SetCursorPosition()
  " dont do it when writing a commit log entry
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  else
    call cursor(1,1)
  endif
endfunction

:lua << EOF
  local nvim_lsp = require('lspconfig')
  local servers = {'solargraph'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
    }
  end
EOF
