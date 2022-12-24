let mapleader =","

map <leader><leader> :keepp /<++><CR>ca<
imap <leader><leader> <esc>:keepp /<++><CR>ca<

" Basic mappings:
" CTRL-y to copy selected text to clipboard
" Make sure [xsel or xclip] is installed if using X11
" Make sure [wl_copy and wl_paste] is installed if using Wayland
	vmap <C-y> "+y

" Comment is ctrl + / (vim commentary plugins require)
    " Move down one line after comment
	map <C-_> gccj
	imap <C-_> <ESC>gccj
    " Stay atthat line after comment (remove j after comment)

" Mapping for compiling LaTeX docs
	map <F2> :w<CR> :!pdflatex %<CR><CR>
" Open evince for pdf of current LaTeX
	map <F3> :!evince $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>

" Perform dot commands over visual blocks:
	vnoremap . :normal .<CR>
" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck -x %<CR>

" Open my bibliography file in split
	map <leader>b :vsp<space>$BIB<CR>
	map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>

" Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
" Here leader is ";".
" So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
" if typed fast without the timeout.
" source ~/.config/nvim/shortcuts.vim
