local augroup = user.vim.augroup
local autocmd = user.vim.autocmd

-- user.statusline.set()

augroup('userStatusline', function()
  autocmd(
    'BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter',
    '*',
    user.statusline.check_modified
  )
  autocmd('ColorScheme', '*', user.statusline.update_highlight)
  autocmd('User', 'FerretAsyncStart', user.statusline.async_start)
  autocmd('User', 'FerretAsyncFinish', user.statusline.async_finish)
end)
