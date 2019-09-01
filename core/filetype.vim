
augroup MyAutoCmd

    	" Reload vim config automatically
	autocmd BufWritePost $VIM_PATH/core/* nested source $MYVIMRC | redraw

	autocmd WinEnter,InsertLeave * set cursorline

	autocmd WinLeave,InsertEnter * set nocursorline

    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

	autocmd Syntax * if 5000 < line('$') | syntax sync minlines=200 | endif

    autocmd FileType css setlocal equalprg=csstidy\ -\ --silent=true

    autocmd BufWritePre *.js,*.jsx,*.less,*.css,*.html Neoformat
    if has('mac')
        au BufReadCmd *.png,*.jpg,*.jpeg sil exe "!open " . shellescape(expand("<afile>")) . "&>/dev/null" |
        \ let tobedeleted = bufnr('%') | b# | exe "bd! " . tobedeleted
    else
        au BufReadCmd *.png,*.jpg,*.jpeg sil exe "!xdg-open " . shellescape(expand("<afile>")) . "&>/dev/null" |
        \ let tobedeleted = bufnr('%') | b# | exe "bd! " . tobedeleted
    endif

