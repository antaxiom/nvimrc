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

colorscheme onedark
set mouse=a
set clipboard+=unnamedplus
set number

set ignorecase
set smartindent
lua require'plug-colorizer'
inoremap <silent> <leader>r :FloatermNew ranger<CR>
