""" ruby config
let ruby_operators = 1


""" Custom Javascript configuration
let g:javascript_plugin_jsdoc = 1    " Highlight JSDoc


""" editorconfig
let g:EditorConfig_core_mode = 'external_command'


""" fzf config
let $FZF_DEFAULT_COMMAND = 'ag -l --nocolor --hidden -g ""'
nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>f :Buffers<CR>


""" Indent guides
let g:indentLine_char = '┆'


""" neomake configuration
" Use <leader>e to go to the next error
nnoremap <leader>e :call LocationNext()<cr>


""" deoplete configuration
let g:deoplete#enable_at_startup = 1
" Improve ultisnips and deoplete integration
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])


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
" Get colors from color scheme
let s:colors = palenight#GetColors()

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('md', 'blue', 'none', s:colors.blue.gui, 'none')
call NERDTreeHighlightFile('yml', 'magenta', 'none', s:colors.purple.gui, 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none', s:colors.yellow.gui, 'none')
call NERDTreeHighlightFile('html', 'blue', 'none', s:colors.blue.gui, 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', s:colors.cyan.gui, 'none')
call NERDTreeHighlightFile('scss', 'cyan', 'none', s:colors.cyan.gui, 'none')
call NERDTreeHighlightFile('coffee', 'yellow', 'none', s:colors.dark_yellow.gui, 'none')
call NERDTreeHighlightFile('js', 'yellow', 'none', s:colors.yellow.gui, 'none')
call NERDTreeHighlightFile('rb', 'red', 'none', s:colors.red.gui, 'none')


""" vim-test configuration
nmap <silent> <leader>o :TestNearest<CR>
nmap <silent> <leader>O :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'  ],
      \             [ 'gitbranch', 'neomake', 'readonly', 'filename', 'modified'  ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'neomake': 'NeomakeLightline'
      \ },
      \ }

function! NeomakeLightline()
  if !exists('*neomake#statusline#LoclistCounts')
    return ''
  endif

  " Count all the errors, warnings
  let total = 0

  for v in values(neomake#statusline#LoclistCounts())
    let total += v
  endfor

  for v in items(neomake#statusline#QflistCounts())
    let total += v
  endfor

  if total == 0
    return ''
  endif

  return 'line '.getloclist(0)[0].lnum. ', 1 of '.total
endfunction

function! LocationNext()
  try
    lnext
  catch
    try | lfirst | catch | endtry
  endtry
endfunction
