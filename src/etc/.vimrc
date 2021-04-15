set paste
set tabstop=4
set number

let &runtimepath.=','.'/usr/share/vim-editorconfig'

if filereadable("/etc/vim/cspeterson_statusline")
  source /etc/vim/cspeterson_statusline
endif
