local default_config = require("nvim-filetype.config")

local M = {}

-- Active config, accessible as require("nvim-filetype").config
M.config = vim.tbl_extend("force", {}, default_config)

-- Sorted list of all filetypes known to Neovim, populated on first use.
-- Stable for the lifetime of a session, so one call is enough.
local _ft_cache = nil

local function get_all_filetypes()
	if not _ft_cache then
		_ft_cache = vim.fn.getcompletion("", "filetype")
		table.sort(_ft_cache)
	end
	return _ft_cache
end

-- List building --------------------------------------------------------------

local function build_filetype_list()
	local result = {}
	local seen = {}

	-- 1. Pinned filetypes from config (always first, in configured order)
	for _, ft in ipairs(M.config.filetypes) do
		result[#result + 1] = ft
		seen[ft] = true
	end

	-- 2. Remaining filetypes alphabetically
	if M.config.show_all_filetypes then
		for _, ft in ipairs(get_all_filetypes()) do
			if not seen[ft] then
				result[#result + 1] = ft
			end
		end
	end

	return result
end

-- Public API -----------------------------------------------------------------

function M.show_selector()
	local filetypes = build_filetype_list()

	if #filetypes == 0 then
		vim.notify(
			"nvim-filetype: no filetypes to show.\n"
				.. "Set show_all_filetypes=true or add entries to the filetypes config.",
			vim.log.levels.WARN
		)
		return
	end

	local current_ft = vim.bo.filetype

	vim.ui.select(filetypes, {
		prompt = "Select Filetype: ",
		format_item = function(item)
			if item == current_ft then
				return item .. " " .. M.config.selected_icon
			end
			return item
		end,
	}, function(choice)
		if choice then
			vim.bo.filetype = choice
		end
	end)
end

-- Optional: call setup() to override defaults.
-- The :FTSelect command is always available without calling setup().
---@param options nvim-filetype.config
function M.setup(options)
	-- Shallow extend: replaces filetypes array entirely rather than merging by index.
	M.config = vim.tbl_extend("force", default_config, options or {})
end

return M
