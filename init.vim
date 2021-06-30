source ~/.config/nvim/vimrcs/plug.vim

source ~/.config/nvim/vimrcs/basic.vim
source ~/.config/nvim/vimrcs/filetypes.vim
source ~/.config/nvim/vimrcs/plugins_config.vim
source ~/.config/nvim/vimrcs/extended.vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
  set termguicolors
endif

lua require'colorizer'.setup()

autocmd BufWritePre * %s/\s\+$//e

    if empty(v:servername) && exists('*remote_startserver')
      call remote_startserver('VIM')
    endif

let g:yankring_clipboard_monitor=[]

au BufNewFile,BufFilePre,BufRead,BufWritePre *.md set filetype=markdown

let g:snipMate = { 'snippet_version' : 1 }

colorscheme onedark

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
