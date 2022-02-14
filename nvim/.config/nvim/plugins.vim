" List all plugins here.
"
" Configurations for plugins should be defined in plugin-config.vim
call plug#begin()

Plug 'tpope/vim-sensible'               " Some sensible settings
Plug 'tpope/vim-sleuth'                 " Autodetect file spacing
Plug 'scrooloose/nerdcommenter'         " Awesome Commenting
Plug 'vim-scripts/autoswap.vim'         " Handle swap files intelligently
Plug 'sheerun/vim-polyglot'             " Mega language support pack
Plug 'honza/vim-snippets'               " Snippets
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'hoob3rt/lualine.nvim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

""" Color schemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'wadackel/vim-dogrun'

Plug 'keith/rspec.vim'
Plug 'tpope/vim-rails'

Plug 'pechorin/any-jump.vim'

Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'neomake/neomake'                  " Syntax checking
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'    " .editorconfig support
Plug 'tpope/vim-surround'               " Change your surroundings
Plug 'terryma/vim-multiple-cursors'     " Multiple cursors
Plug 'easymotion/vim-easymotion'        " Navigate files with ease
Plug 'janko-m/vim-test'                 " Running tests
Plug 'junegunn/vim-easy-align'          " Align things
Plug 'mattn/emmet-vim'                  " Expanding abbreviations

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()

