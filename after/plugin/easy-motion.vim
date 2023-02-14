" easymotion

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
"nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-s)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

hi EasyMotionTarget guifg=#d73925
hi EasyMotionTarget2First guifg=#ffcc66
hi EasyMotionTarget2Second guifg=#dfa82a
hi EasyMotionShade guifg=#8e8277
