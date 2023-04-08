return {
	"sindrets/diffview.nvim",
	cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose" },
	keys = {
		{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff (working tree)" },
		{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git history (this file)" },
		{ "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git history (repo)" },
	},
	opts = {
		-- q is only bound in the option/help panels by default; bind it
		-- everywhere so one press tears down the whole tab
		keymaps = {
			view = {
				{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
			},
			file_panel = {
				{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
			},
			file_history_panel = {
				{ "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
			},
		},
	},
}
