" hi ActiveWindow guibg=#232136
" hi InactiveWindow guibg=#2d2a45
"
" augroup WindowManagement
"   autocmd!
"   autocmd WinEnter * call Handle_Win_Enter()
"   autocmd FocusLost * call Handle_Focus_Lost()
"   autocmd FocusGained * call Handle_Focus_Gained()
" augroup END
"
" function! Handle_Win_Enter()
"   setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" endfunction
"
" function! Handle_Focus_Lost()
"   setlocal winhighlight=Normal:InactiveWindow,NormalNC:InactiveWindow
" endfunction
"
" function! Handle_Focus_Gained()
"   setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" endfunction
