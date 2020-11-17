"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requires that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
let g:ctrlp_map = '<C-f>'
map <leader>j :CtrlP<cr>

" Quickly find and open a buffer
map <leader>b :CtrlPBuffer<cr>

" Quickly find and open a recently opened file
map <leader>f :CtrlPMRU<CR>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ ['mode', 'paste'],
"       \             ['fugitive', 'readonly', 'filename', 'modified'] ],
"       \   'right': [ [ 'lineinfo' ], ['percent'] ]
"       \ },
"       \ 'component': {
"       \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
"       \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"       \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
"       \ },
"       \ 'component_visible_condition': {
"       \   'readonly': '(&filetype!="help"&& &readonly)',
"       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"       \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
"       \ },
"       \ 'separator': { 'left': ' ', 'right': ' ' },
"       \ 'subseparator': { 'left': ' ', 'right': ' ' }
"       \ }


" enable tabline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
" let airline#extensions#tabline#show_splits = 0
" let airline#extensions#tabline#tabs_label = ''

" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#coc#enabled = 1

" Just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'

" enable powerline fonts
let g:airline_powerline_fonts = 1
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
" let g:airline_skip_empty_sections = 1

let g:airline_section_c = airline#section#create([''])
" let g:airline_section_z = airline#section#create(['linenr'])

" Switch to your current theme
" let g:airline_theme = 'onedark'

" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Sections
" let g:airline_section_c = ''
let g:airline_section_a = "Mach 3"
" let g:airline_section_a = ""
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bullets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => AutoPairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'


let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" VimWiki
  let g:vimwiki_key_mappings =
    \ {
    \   'all_maps': 1,
    \   'global': 1,
    \   'headers': 1,
    \   'text_objs': 1,
    \   'table_format': 1,
    \   'table_mappings': 1,
    \   'lists': 1,
    \   'links': 1,
    \   'html': 1,
    \   'mouse': 1,
    \ }

" Filetypes enabled for
let g:vimwiki_filetypes = ['markdown']

let g:vimwiki_list = [{'path': '~/Documents/notes/vimwiki/',
\ 'exclude_files': ['**/README.md', '**/Readme.md'] }]

" let g:vimwiki_auto_header = 0
" let g:vimwiki_markdown_header_style = 1
" let g:vimwiki_tags_header_level = 1
" let g:vimwiki_tags_header = 'Generated Tags'
" let g:vimwiki_links_header_level = 1
" let g:vimwiki_links_header = 'Generated Links'
" let g:vimwiki_auto_chdir = 0
" let g:vimwiki_map_prefix = '<Leader>w'
" let g:vimwiki_toc_link_format = 0
" let g:vimwiki_toc_header_level = 1
" let g:vimwiki_toc_header = 'Contents'
" let g:vimwiki_autowriteall = 1
" let g:vimwiki_conceal_pre = 0
" let g:vimwiki_conceal_onechar_markers = 1
" let g:vimwiki_conceallevel = 2
" let g:vimwiki_user_htmls = ''
" let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr'
" let g:vimwiki_html_header_numbering_sym = ''
" let g:vimwiki_html_header_numbering = 0
" let g:vimwiki_dir_link = ''
" let g:vimwiki_markdown_link_ext = 0
" let g:vimwiki_create_link = 1
" let g:vimwiki_use_calendar = 1
" let g:vimwiki_text_ignore_newline = 1
" let g:vimwiki_list_ignore_newline = 1
" let g:vimwiki_folding = ''
" let g:vimwiki_listsym_rejected = '✗'
" let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_global_ext = 0
" let g:vimwiki_hl_cb_checked = 0




let g:vimwiki_diary_months = {
      \ 1: 'January', 2: 'February', 3: 'March',
      \ 4: 'April', 5: 'May', 6: 'June',
      \ 7: 'July', 8: 'August', 9: 'September',
      \ 10: 'October', 11: 'November', 12: 'December'
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Tex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'


