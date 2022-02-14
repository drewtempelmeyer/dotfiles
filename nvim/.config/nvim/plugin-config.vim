""" ruby config
let ruby_operators = 1


""" Custom Javascript configuration
let g:javascript_plugin_jsdoc = 1    " Highlight JSDoc


""" editorconfig
let g:EditorConfig_core_mode = 'external_command'


""" fzf config
nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>f :Buffers<CR>


""" neomake configuration
" Use <leader>e to go to the next error
nnoremap <leader>e :call LocationNext()<cr>

""" Insert snippets on return
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
      \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

""" vim-test configuration
let test#strategy = "neovim"

nmap <silent> <leader>o :TestNearest<CR>
nmap <silent> <leader>O :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


let g:lualine = {
      \'options' : {
        \  'theme' : 'spaceduck',
        \  'section_separators' : ['', ''],
        \  'component_separators' : ['', ''],
        \  'icons_enabled' : v:true,
        \},
        \'sections' : {
          \  'lualine_a' : [ ['mode', {'upper': v:true,},], ],
          \  'lualine_b' : [ ['branch', {'icon': '',}, ], ],
          \  'lualine_c' : [ ['filename', {'file_status': v:true,},], ],
          \  'lualine_x' : [ 'encoding', 'fileformat', 'filetype' ],
          \  'lualine_y' : [ 'progress' ],
          \  'lualine_z' : [ 'location'  ],
          \},
          \'inactive_sections' : {
            \  'lualine_a' : [  ],
            \  'lualine_b' : [  ],
            \  'lualine_c' : [ 'filename' ],
            \  'lualine_x' : [ 'location' ],
            \  'lualine_y' : [  ],
            \  'lualine_z' : [  ],
            \},
            \'extensions' : [ 'fzf' ],
            \}

lua require("lualine").setup()

let g:lightline = {
      \ 'colorscheme': 'spaceduck',
      \ 'active': {
        \   'left': [ [ 'mode', 'paste'  ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'method'  ] ]
        \ },
        \ 'component_function': {
          \   'gitbranch': 'fugitive#head',
          \   'method': 'NearestMethodOrFunction'
          \ },
          \ }
