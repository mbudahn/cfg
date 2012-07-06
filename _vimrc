set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set ch=2
set number
set nobackup
set splitright
set guifont=ProggyCleanTT:h12:cDEFAULT
set laststatus=2
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
unmap <C-A>
nmap <silent> <C-D> :NERDTreeToggle<CR>
imap <F3> <ESC>:BufExplorer<CR>
map <F3> :BufExplorer<CR>
imap <F4> <ESC>:NERDTree 
map <F4> :NERDTree 
au GUIEnter * simalt ~x
colorscheme wombat
call pathogen#infect()
cd ~\Documents
