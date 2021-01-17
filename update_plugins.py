try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import zipfile
import shutil
import tempfile
import requests

from os import path

# --- Globals ----------------------------------------------
PLUGINS = """
ale https://github.com/w0rp/ale
vim-yankstack https://github.com/maxbrunsfeld/vim-yankstack
ack.vim https://github.com/mileszs/ack.vim
bufexplorer https://github.com/jlanzarotta/bufexplorer
ctrlp.vim https://github.com/ctrlpvim/ctrlp.vim
mayansmoke https://github.com/vim-scripts/mayansmoke
nerdtree https://github.com/scrooloose/nerdtree
nginx.vim https://github.com/chr4/nginx.vim
open_file_under_cursor.vim https://github.com/amix/open_file_under_cursor.vim
tlib https://github.com/vim-scripts/tlib
vim-addon-mw-utils https://github.com/MarcWeber/vim-addon-mw-utils
vim-bundle-mako https://github.com/sophacles/vim-bundle-mako
vim-coffee-script https://github.com/kchmck/vim-coffee-script
vim-colors-solarized https://github.com/altercation/vim-colors-solarized
vim-indent-object https://github.com/michaeljsmith/vim-indent-object
vim-less https://github.com/groenewege/vim-less
vim-pyte https://github.com/therubymug/vim-pyte
vim-snipmate https://github.com/garbas/vim-snipmate
vim-snippets https://github.com/honza/vim-snippets
vim-surround https://github.com/tpope/vim-surround
vim-expand-region https://github.com/terryma/vim-expand-region
vim-multiple-cursors https://github.com/terryma/vim-multiple-cursors
vim-fugitive https://github.com/tpope/vim-fugitive
goyo.vim https://github.com/junegunn/goyo.vim
vim-zenroom2 https://github.com/amix/vim-zenroom2
vim-repeat https://github.com/tpope/vim-repeat
vim-commentary https://github.com/tpope/vim-commentary
vim-gitgutter https://github.com/airblade/vim-gitgutter
vim-abolish https://github.com/tpope/tpope-vim-abolish
rust.vim https://github.com/rust-lang/rust.vim
vim-gist https://github.com/mattn/vim-gist
vim-ruby https://github.com/vim-ruby/vim-ruby
typescript-vim https://github.com/leafgarland/typescript-vim
vim-javascript https://github.com/pangloss/vim-javascript
vim-airline https://github.com/vim-airline/vim-airline
vim-airline-themes https://github.com/vim-airline/vim-airline-themes
vim-polyglot https://github.com/sheerun/vim-polyglot
vim-smoothie https://github.com/psliwka/vim-smoothie
onedark.vim https://github.com/antaxiom/onedark.vim
coc.nvim -b release https://github.com/neoclide/coc.nvim
bullets.vim https://github.com/dkarter/bullets.vim
vim-better-whitespace https://github.com/ntpeters/vim-better-whitespace
vimwiki https://github.com/vimwiki/vimwiki.git
vimtex https://github.com/lervag/vimtex.git
pear-tree https://github.com/tmsvg/pear-tree.git
vim-devicons https://github.com/ryanoasis/vim-devicons.git
vim-grammarous https://github.com/rhysd/vim-grammarous.git
markdown-preview.nvim https://github.com/iamcco/markdown-preview.nvim.git
vim-pandoc-syntax https://github.com/vim-pandoc/vim-pandoc.git
vim-pandoc https://github.com/vim-pandoc/vim-pandoc.git
nvim-treesitter https://github.com/nvim-treesitter/nvim-treesitter.git
barbar.nvim ttps://github.com/romgrk/barbar.nvim.git
""".strip()

GITHUB_ZIP = "%s/archive/master.zip"

SOURCE_DIR = path.join(path.dirname(__file__), "sources_non_forked")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, "wb").write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(
        temp_dir, path.join(temp_dir, "%s-master" % plugin_name)
    )

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    download_extract_replace(name, zip_path, temp_directory, SOURCE_DIR)


if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
