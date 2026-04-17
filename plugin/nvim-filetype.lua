-- Auto-sourced by Neovim on startup.
-- Registers the :FTSelect command so setup() is not required for basic use.
vim.api.nvim_create_user_command("FTSelect", function()
	require("nvim-filetype").show_selector()
end, { desc = "Select filetype for current buffer" })
