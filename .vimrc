" ====== general settings ======
set nocompatible                                                      " don't disable VIM

set tabstop=2                                                         " make exisiting tabs look like spaces
set shiftwidth=2                                                      " set spaces for > command
set expandtab                                                         " insert spaces when pressing tab

set backspace=indent,eol,start
set ruler                                                             " display horizontal cursor info
set number                                                            " turn on line numbers
set showcmd                                                           " display command you're typing
set incsearch                                                         " search while typing
set noshowmode                                                        " turn off default mode indicator (replaced by vim-airline)
set hlsearch                                                          " highlight search results
syntax on                                                             " syntax highlighting

set nowrap                                                            " do not wrap lines
set textwidth=0
set wrapmargin=0
set formatoptions-=t

hi CursorLineNr cterm=bold ctermfg=32

" ====== setting up plugins ======

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'

call plug#end()

" ------ plugin: NERDTree  ------
                                                                      " toggle NERDtree with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:NERDTreeWinSize=35                                              " change size of NERDTree window

" ----- plugin: vim-easytags -----
set tags=./tags;,~/.vimtags                                           " Where to look for tags files
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- plugin: tagbar -----
                                                                      " toggle tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
let g:tagbar_width = 30

" ----- plugin: delimitMate -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- plugin: lightline -----
set laststatus=2                                                      " always show status bar
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" ----- plugin: Goyo -----
let g:goyo_width=100
let g:goyo_margin_top=2
let g:goyo_margin_bottom=2
nnoremap <silent> <leader>z :Goyo<CR>

" ===== Keybindings  =====

inoremap ;mk <++>
                                                                      " bind \\ to find next "<++>" and edit
inoremap <leader><leader> <esc>:set nohlsearch<Enter>/<++><Enter>c4l<esc>:let @/=""<Enter>:set hlsearch<Enter>:<BS>a
vnoremap <leader><leader> <esc>:set nohlsearch<Enter>/<++><Enter>c4l<esc>:let @/=""<Enter>:set hlsearch<Enter>:<BS>a
map <leader><leader> <esc>:set nohlsearch<Enter>/<++><Enter>c4l<esc>:let @/=""<Enter>:set hlsearch<Enter>:<BS>a
                                                                      " bind \] to find next "<++>" and delete line
inoremap <leader>] <esc>:set nohlsearch<Enter>/<++><Enter>dd<esc>:let @/=""<Enter>:set hlsearch<Enter>:<BS>
vnoremap <leader>] <esc>:set nohlsearch<Enter>/<++><Enter>dd<esc>:let @/=""<Enter>:set hlsearch<Enter>:<BS>
map <leader>] <esc>:set nohlsearch<Enter>/<++><Enter>dd<esc>:let @/=""<Enter>:set hlsearch<Enter>:<BS>

" ----- C++ bindings  -----
autocmd FileType cpp inoremap ;fr for(; <++>; <++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f;i
autocmd FileType cpp inoremap ;fe for( : <++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f:hi
autocmd FileType cpp inoremap ;wl while() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType cpp inoremap ;if if() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType cpp inoremap ;ie if() {<Enter><++><Enter>} else {<Enter><++><Enter>}<Enter><++><Esc>5k^f)i
autocmd FileType cpp inoremap ;mn int main() {<Enter>;<Enter>}<Enter><Esc>2k^xA
autocmd FileType cpp inoremap ;pr std::cout <<  << std::endl;<Enter><++><Esc>k^2f a

" ----- Java bindings  -----
autocmd FileType java inoremap ;fr for(; <++>; <++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f;i
autocmd FileType java inoremap ;fe for( : <++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^f:hi
autocmd FileType java inoremap ;wl while() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType java inoremap ;if if() {<Enter><++><Enter>}<Enter><++><Esc>3k^f)i
autocmd FileType java inoremap ;ie if() {<Enter><++><Enter>} else {<Enter><++><Enter>}<Enter><++><Esc>5k^f)i
autocmd FileType java inoremap ;cl class <++> {<Enter><++><Enter>}<Esc>2k^i <Esc>i
autocmd FileType java inoremap ;pf public  <++>(<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^fc2li
autocmd FileType java inoremap ;rf private  <++>(<++>) {<Enter><++><Enter>}<Enter><++><Esc>3k^fc2li
autocmd FileType java inoremap ;mn public static void main(String[] args) {<Enter>;<Enter>}<Enter><++><Esc>2k^xA
autocmd FileType java inoremap ;pr System.out.println();<Enter><++><Esc>k^f)i

" ----- Python bindings  -----
autocmd FileType python inoremap ;fr for  in <++>:<Enter><++><Enter><C-D><++><Esc>2k^fihi
autocmd FileType python inoremap ;wl while():<Enter><++><Enter><C-D><++><Esc>2k^f)i
autocmd FileType python inoremap ;we while():<Enter><++><Enter><C-D>else:<Enter><++><Enter><C-D><++><Esc>4k^f)i
autocmd FileType python inoremap ;if if :<Enter><++><Enter><C-D><++><Esc>2k^f:i
autocmd FileType python inoremap ;ie if :<Enter><++><Enter><C-D>else:<Enter><++><Enter><C-D><++><Esc>4k^f:i
autocmd FileType python inoremap ;ii if :<Enter><++><Enter><C-D>el<++><Esc>2k^f:i
autocmd FileType python inoremap ;cl class :<Enter><++><Esc>k^f:i
autocmd FileType python inoremap ;fn def (<++>):<Enter><++><Enter><C-D><++><Esc>2k^f(i
autocmd FileType python inoremap ;mn def main():<Enter>;<Enter><Enter><C-D>if __name__ == "__main__":<Enter>main()<Esc>3k^xA
autocmd FileType python inoremap ;pr print()<Enter><++><Esc>k^f)i
