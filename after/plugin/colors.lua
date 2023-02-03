function ColorMyPencils(color)
    color = color or "oxocarbon-lua"
	vim.cmd.colorscheme(color)

	-- transparent background
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "None" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })
end

ColorMyPencils()
