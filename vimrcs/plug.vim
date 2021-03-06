call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'romgrk/barbar.nvim'
Plug 'jlanzarotta/bufexplorer'
Plug 'dkarter/bullets.vim'
Plug 'neoclide/coc.nvim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'ferrine/md-img-paste.vim'
Plug 'preservim/nerdtree'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kyazdani42/nvim-web-devicons'
Plug 'antaxiom/onedark.vim'
Plug 'rust-lang/rust.vim'
Plug 'godlygeek/tabular'
Plug 'leafgarland/typescript-vim'
Plug 'wfxr/minimap.vim'
Plug 'tpope/vim-abolish'
Plug 'jdelkins/vim-correction'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'isRuslan/vim-es6'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
Plug 'quabug/vim-gdscript'
Plug 'machakann/vim-highlightedyank'
Plug 'pangloss/vim-javascript'
Plug 'farmergreg/vim-lastplace'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'psliwka/vim-smoothie'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'evanleck/vim-svelte'
Plug 'amix/vim-zenroom2'
Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'

call plug#end()

" Automatically install missing plugins on startup
" Graciously stolen from Christian Chiarulli
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
