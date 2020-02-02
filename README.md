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

## Project-specific settings

You may define project-specific settings, such as build commands, in a file named ``.vimlocal``. Place this file in
the root of the project and make sure to start Vim in this root folder. The file is written in Vim-script and contains
scripts that are too project-specfic to be in ``.vimrc``.

