""" ruby config
let ruby_operators = 1


""" Custom Javascript configuration
let g:javascript_plugin_jsdoc = 1    " Highlight JSDoc


""" editorconfig
let g:EditorConfig_core_mode = 'external_command'


""" fzf config
nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>f :Buffers<CR>


""" Indent guides
let g:indentLine_char = '┆'


""" neomake configuration
" Use <leader>e to go to the next error
nnoremap <leader>e :call LocationNext()<cr>

""" edge colorscheme
let g:edge_style = 'neon'
let g:edge_enable_italic = 1

""" coc config
let g:coc_node_path = '/home/drew/.nvm/versions/node/v13.3.0/bin/node'

""" startify config
let g:startify_change_to_vcs_root = 1 " Change to git root instead of file dir

""" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1


""" NERDTree
let NERDTreeIgnore = ['node_modules', 'tmp', 'bower_components']
" Don't want to see the extra text
let NERDTreeMinimalUI = 1
" Close NERDTree after reading file
autocmd BufReadPre,FileReadPre * :NERDTreeClose
map <silent> <leader>n :NERDTreeToggle<CR>


""" vim-test configuration
let test#strategy = "neovim"

nmap <silent> <leader>o :TestNearest<CR>
nmap <silent> <leader>O :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:lightline = {
      \ 'colorscheme': 'edge',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'method'  ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'method': 'NearestMethodOrFunction'
      \ },
      \ }

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

function! LocationNext()
  try
    lnext
  catch
    try | lfirst | catch | endtry
  endtry
endfunction
