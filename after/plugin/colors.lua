function ColorMyPencils(color)
  color = color or "oxocarbon-lua"

  -- gruvbox-material options
  -- vim.g.gruvbox_material_background = "hard"
  -- vim.g.gruvbox_material_dim_inactive_windows = 1
  vim.cmd.colorscheme(color)
  -- color = color or "oxocarbon-lua"

  -- transparent background
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
end

-- ColorMyPencils("gruvbox-material")
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,     -- Disable setting background
    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,    -- Non focused panes set to alternative background
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
  },
})

-- vim.cmd.colorscheme("gruvbox-material")
-- vim.cmd.background("dark")
vim.cmd.colorscheme("duskfox")
-- vim.cmd.colorscheme("no-clown-fiesta")
-- vim.cmd.colorscheme("oxocarbon-lua")
-- vim.cmd.colorscheme("catppuccin_mocha")
-- vim.cmd.colorscheme("catppuccin_macchiato")
-- vim.cmd.colorscheme("catppuccin_frappe")
-- vim.cmd.colorscheme("catppuccin_latte")
