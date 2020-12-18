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

au BufNewFile,BufRead * nested
  \ if &buftype != "help" |
  \   tab sball |
  \ endif
