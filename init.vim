set runtimepath+=~/.config/nvim


source ~/.config/nvim/vimrcs/basic.vim
source ~/.config/nvim/vimrcs/filetypes.vim
source ~/.config/nvim/vimrcs/plugins_config.vim
source ~/.config/nvim/vimrcs/extended.vim

try
    source ~/.config/nvim/my_configs.vim
catch
endtry

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
  set termguicolors
endif

lua require'plug-colorizer'

colorscheme onedark

autocmd BufWritePre * %s/\s\+$//e

    if empty(v:servername) && exists('*remote_startserver')
      call remote_startserver('VIM')
    endif

let g:yankring_clipboard_monitor=[]

au BufNewFile,BufFilePre,BufRead,BufWritePre *.md set filetype=markdown

let g:snipMate = { 'snippet_version' : 1 }

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF


