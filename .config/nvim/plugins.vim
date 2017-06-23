" List all plugins here.
"
" Configurations for plugins should be defined in plugin-config.vim
call plug#begin()

Plug 'tpope/vim-sensible'               " Some sensible settings
Plug 'tpope/vim-sleuth'                 " Autodetect file spacing
Plug 'scrooloose/nerdcommenter'         " Awesome Commenting
Plug 'vim-scripts/auto-pairs-gentle'    " Add brackets automatically
Plug 'vim-scripts/autoswap.vim'         " Handle swap files intelligently
Plug 'sheerun/vim-polyglot'             " Mega language support pack
Plug 'dracula/vim'                      " Dracular color scheme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-fugitive'               " Git wrapper
Plug 'itchyny/lightline.vim'            " Awesome status bar
Plug 'neomake/neomake'                  " Syntax checking
Plug 'ctrlpvim/ctrlp.vim'               " ctrlp fuzzy finder
Plug 'editorconfig/editorconfig-vim'    " .editorconfig support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Keyword completion
Plug 'tpope/vim-surround'               " Change your surroundings
Plug 'terryma/vim-multiple-cursors'     " Multiple cursors
Plug 'Yggdroot/indentLine'              " Indent guides
Plug 'easymotion/vim-easymotion'        " Navigate files with ease
Plug 'scrooloose/nerdtree'              " File tree view
Plug 'ryanoasis/vim-devicons'

Plug 'SirVer/ultisnips'                 " Snippets engine
Plug 'honza/vim-snippets'               " Snippets

call plug#end()

