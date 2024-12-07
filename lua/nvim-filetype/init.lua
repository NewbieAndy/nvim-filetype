local default_config = require("nvim-filetype.config")

local M = {}

---@Param opts nvim-filetype.config
function M.get_filetypes(opts)
	local selectable_fts = {}
	local config_fts_dict = {}
	-- config filetypes
	local opt_fts = opts.filetypes
	for _, ft in ipairs(opt_fts) do
		table.insert(selectable_fts, ft)
		config_fts_dict[ft] = ft
	end
	-- all filetypes
	if opts.show_all_filetypes then
		local all_fts = vim.fn.getcompletion("", "filetype")
		table.sort(all_fts)
		for _, ft in ipairs(all_fts) do
			if not config_fts_dict[ft] then
				table.insert(selectable_fts, ft)
			end
		end
	end
	return selectable_fts
end

function M.update_ft(new_ft)
	vim.api.nvim_buf_set_option(0, "filetype", new_ft)
end

---@Param opts nvim-filetype.config
function M.show_selector(opts)
	local filetypes = M.get_filetypes(opts)

	-- Create a popup menu with filetype options
	local prompt_opts = {
		prompt = "Select Filetype: ",
		completion = function(input)
			local matches = {}
			for _, ft in ipairs(filetypes) do
				if ft:find(input) then
					table.insert(matches, ft)
				end
			end
			return matches
		end,
		format_item = function(item)
			if item == vim.bo.filetype then
				return item .. " " .. opts.selected_icon
			else
				return item
			end
		end,
	}

	vim.ui.select(filetypes, prompt_opts, function(choice)
		if choice then
			M.update_ft(choice)
		end
	end)
end

---@Param options nvim-filetype.config
function M.setup(options)
	options = vim.tbl_deep_extend("force", default_config, options or {})
	vim.api.nvim_create_user_command("FTSelect", function()
		M.show_selector(options)
	end, {})
end

return M
