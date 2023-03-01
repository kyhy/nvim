local function setGlobalHighlight(name, color)
  vim.api.nvim_set_hl(0, name, {
    background = color
  })
end

local function setLocalHighlight(hl)
  vim.api.nvim_win_set_option(0, "winhighlight", hl)
end

setGlobalHighlight('ActiveWindow', '#232136')
setGlobalHighlight('InactiveWindow', '#2d2a45')

vim.api.nvim_create_autocmd({"FocusLost"}, {
  callback = function()
    setLocalHighlight("Normal:InactiveWindow,NormalNC:InactiveWindow,StatusLineNC:InactiveWindow")

  -- vim.cmd('highlight clear StatusLineNC')
  -- vim.cmd('highlight! link StatusLineNC User1')
  end
})

vim.api.nvim_create_autocmd({"FocusGained", "WinEnter"}, {
  callback = function()
    setLocalHighlight("Normal:ActiveWindow,NormalNC:InactiveWindow,StatusLineNC:ActiveWindow")
  end
})

