scriptencoding utf-8

" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
if has('statusline')
  let s:gb = {}
  let s:gb.left_bg   = '#CC241D'
  let s:gb.left_fg   = '#FBF1C7'
  let s:gb.center_bg = '#3C3836'
  let s:gb.center_fg = '#A89984'
  let s:gb.right_bg  = '#A89984'
  let s:gb.right_fg  = '#282828'

  " ===== Left =====
  " Buffer number
  execute 'hi User7 guibg='.s:gb.left_bg.' guifg='.s:gb.left_fg
  " Arrow bit
  execute 'hi User4 guibg='.s:gb.center_bg.' guifg='.s:gb.left_bg

  " ===== Center =====
  " Pathname
  execute 'hi User1 guibg='.s:gb.center_bg.' guifg='.s:gb.center_fg
  " Filename
  execute 'hi User3 guibg='.s:gb.center_bg.' guifg='.s:gb.center_fg.' gui=bold'
  " Filetype
  execute 'hi User2 guibg='.s:gb.center_bg.' guifg='.s:gb.center_fg

  " ===== Right =====
  " Arrow bit
  execute 'hi User5 guibg='.s:gb.center_bg.' guifg='.s:gb.right_bg
  " Fileinfo
  execute 'hi User6 guibg='.s:gb.right_bg.' guifg='.s:gb.right_fg.' gui=bold'

  " ===== Left =====
  set statusline=%7*                         " Switch to User7 highlight group
  set statusline+=%{statusline#lhs()}
  set statusline+=%*                         " Reset highlight group.
  "set statusline+=%4*                        " Switch to User4 highlight group (Powerline arrow).
  "set statusline+=                          " Powerline arrow.
  "set statusline+=%*                         " Reset highlight group.

  " ===== Center =====
  set statusline+=%1*                        " Switch to User3 highlight group (bold).
  set statusline+=\                          " Space.
  set statusline+=%<                         " Truncation point, if not enough width available.
  set statusline+=%{statusline#fileprefix()} " Relative path to file's directory.
  set statusline+=%*                         " Reset highlight group.
  set statusline+=%3*                         " Reset highlight group.
  set statusline+=%t                         " Filename.
  set statusline+=\                          " Space.
  set statusline+=%*                         " Reset highlight group.
  set statusline+=%2*                        " Switch to User2 highlight group (italics).
  " Needs to be all on one line:
  "   %(                   Start item group.
  "   [                    Left bracket (literal).
  "   %M                   Modified flag: ,+/,- (modified/unmodifiable) or nothing.
  "   %R                   Read-only flag: ,RO or nothing.
  "   %{statusline#ft()}   Filetype (not using %Y because I don't want caps).
  "   %{statusline#fenc()} File-encoding if not UTF-8.
  "   ]                    Right bracket (literal).
  "   %)                   End item group.
  set statusline+=%([%M%R%{statusline#ft()}%{statusline#fenc()}]%)

  "set statusline+=%*   " Reset highlight group.
  set statusline+=%=   " Split point for left and right groups.

  set statusline+=\    " Space.
  set statusline+=%*   " Reset highlight group.

  " ===== Right =====
  "set statusline+=%5*  " Switch to User5 highlight group.
  "set statusline+=    " Powerline arrow.
  "set statusline+=%*   " Reset highlight group.
  set statusline+=%6*  " Switch to User6 highlight group.
  "set statusline+=\    " Space.
  set statusline+=%{statusline#rhs()}
  "set statusline+=\    " Space.
  set statusline+=%*   " Reset highlight group.

  " these don't get triggered for some reason
"  if has('autocmd')
"    augroup WincentStatusline
"      autocmd!
"      autocmd ColorScheme * call statusline#update_highlight()
"      autocmd User FerretAsyncStart call statusline#async_start()
"      autocmd User FerretAsyncFinish call statusline#async_finish()
"    augroup END
"  endif
 endif
