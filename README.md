Configuration files for VIM
===

My configuration files for VIM are based on the following repositories:
* https://github.com/amix/vimrc
* https://github.com/neoclide/coc.nvim

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

