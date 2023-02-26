local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local previewers = require("telescope.previewers")
local Job = require("plenary.job")

function compose(...)
  local funcs = {...}
  return function(x)
    local result = x
    for i = #funcs, 1, -1 do
      result = funcs[i](result)
    end
    return result
  end
end

function gsubFn(src, target) 
  return function(path)
    return string.gsub(path, src, target)
  end
end

local previewer_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)

  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

require('telescope.pickers.layout_strategies').horizontal_merged = function(picker, max_columns, max_lines, layout_config)
	local layout = require('telescope.pickers.layout_strategies').horizontal(picker, max_columns, max_lines, layout_config)

    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- layout.prompt.title = ''
    -- layout.prompt.borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }
    -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    layout.prompt.borderchars = { '─', '│', '─', '│', "╭", "╮", "╯", "╰" }

    layout.results.title = ''
    layout.results.borderchars = { '─', '│', '─', '│', '├', '┤', "╯", "╰" }
    layout.results.line = layout.results.line - 1
    layout.results.height = layout.results.height + 1

    if layout.preview then
      layout.preview.title = ''
      layout.preview.borderchars = { '─', '│', '─', '│', "╭", "╮", "╯", "╰" }
    end

	return layout
end

-- check for any override
-- options = require("core.utils").load_override(options, "nvim-telescope/telescope.nvim")
require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    -- initial_mode = "insert",
    -- selection_strategy = "reset",
    sorting_strategy = "ascending",
    -- layout_strategy = "horizontal",
    layout_strategy = "horizontal_merged",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.50,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.75,
      height = 0.50,
      preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules" },
    -- file_sorter = require("telescope.sorters").get_fuzzy_file,
    -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = function(_, path) 
      return compose(
        gsubFn('~/src/dotfiles/files', '@dotfiles'),
        gsubFn('/Users/spacefuture', '~')
      )(path)

      -- return string.gsub(string.gsub(path, "/Users/spacefuture", "~"), "~/src/dotfiles/files", "@dotfiles")
    end,
    winblend = 0,
    border = true,
    -- results_title = false,
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    color_devicons = true,
    -- set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        -- ["<C-u>"] = false, -- delete line
        ["<M-p>"] = action_layout.toggle_preview,
        ["<C-s>"] = actions.cycle_previewers_next,
        ["<C-a>"] = actions.cycle_previewers_prev,
        -- ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },

  extensions_list = { "themes", "terms" },
})

-- require('telescope').setup {
--   extensions = {
--     fzf = {
--       fuzzy = true,                    -- false will only do exact matching
--       override_generic_sorter = true,  -- override the generic sorter
--       override_file_sorter = true,     -- override the file sorter
--       case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
--                                        -- the default case_mode is "smart_case"
--     }
--   },
--   defaults = {
--     buffer_previewer_maker = previewer_maker,
--     mappings = {
--       i = {
--         ["<esc>"] = actions.close,
--         -- ["<C-u>"] = false, -- delete line
--         ["<M-p>"] = action_layout.toggle_preview,
--         ["<C-s>"] = actions.cycle_previewers_next,
--         ["<C-a>"] = actions.cycle_previewers_prev,
--         -- ["<C-j>"] = actions.move_selection_next,
--         -- ["<C-k>"] = actions.move_selection_previous,
--       },
--     },
--     picker = {
--       layout_config = {
--         mirror = true 
--       }
--     }
--   }
-- }
--
require('telescope').load_extension('fzf')

