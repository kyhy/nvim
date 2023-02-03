" easymotion

let g:EasyMotion_do_mapping = 0 " Disable default mappings

map , <Plug>(easymotion-prefix)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"hi link EasyMotionTarget WarningMsg
"hi link EasyMotionTarget2First WarningMsg
"hi link EasyMotionTarget2Second WarningMsg
"hi link EasyMotionShade Comment

