# Configuration files for VIM

My configuration files for VIM are based on the following repositories:
* https://github.com/amix/vimrc
* https://github.com/neoclide/coc.nvim

## Where to put files

These repositories are provided as Git submodules. Run the following commands to fetch them:
```
git submodule init
git submodule update
```

This repository contains the user-defined files I use for my programming projects. The files
``my_configs.vim``, ``my_configs_coc.vim`` and the folder ``my_plugins`` must be put into
``~/.vim_runtime``.

The plugin CoC use a language server as backend and I use ``clangd`` for C/C++. The configuration
file for CoC, ``coc_settings.json``, is put in ``~/vimfiles`` on Windows.

## Project-specific settings (``.vimlocal``)

You may define project-specific settings, such as build commands, in a file named ``.vimlocal``. Place this file in
the root of the project and make sure to start Vim in this root folder. The file is written in Vim-script and contains
scripts that are too project-specfic to be in ``.vimrc``.

### Toggle between ``include`` and ``src`` folder

Jump to ``include`` folder using ``<leader>gt`` or to ``src`` folder using ``<leader>gb``. By default, the search
starts from the root folder and search for C/C++ headers, but this may be fine-tuned by setting the variables
``g:include_dir``, ``g:src_dir``, ``g:header_extensions`` and ``g:src_extensions``.

## Patch for MRU plugin

The ``MRU`` command opens a new window in the bottom, but this window will automatically resize an open terminal window.
If you want to avoid this and instead open the MRU-window at top, run the following (in Unix or using MSYS/Git bash on
Windows):
```
sh patch_mru_plugin.sh
```

## Terminal usage

You need a newer version of VIM to use the terminal (at least 8.0 and probably 8.2 to resize it). Toggle the terminal
using ``<leader>tt``. If you want to cut/paste or scroll, press ``Ctrl-w N`` and go to the terminal by pressing ``i``.

