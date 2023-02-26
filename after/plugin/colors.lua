require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,     -- Disable setting background
    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = true,    -- Non focused panes set to alternative background
    module_default = true,   -- Default enable value for modules
    styles = {               -- Style to be applied to different syntax groups
      comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {
    all = {
      TelescopePromptTitle = { fg = "palette.magenta" },
      TelescopeBorder = { fg = "palette.magenta", bg = "palette.bg1" },
      TelescopeMatching = { fg = "palette.red" },
      NormalNC = { fg = "palette.fg0", bg = "palette.bg2" }, -- Non-current windows
    }
  },
})

-- vim.cmd("hi link TelescopePromptNormal Normal")
-- vim.cmd("hi link TelescopePromptPrefix Type")
-- vim.cmd("hi link TelescopeResultsDiffAdd GitGutterAdd")
-- vim.cmd("hi link TelescopeResultsDiffChange GitGutterChange")
-- vim.cmd("hi link TelescopeResultsDiffDelete GitGutterDelete")
-- vim.cmd("hi link TelescopeResultsDiffUntracked Title")
