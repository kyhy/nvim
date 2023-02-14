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
