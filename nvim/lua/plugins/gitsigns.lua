return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(buf)
			local gs = require("gitsigns")
			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
			end
			map("]h", gs.next_hunk, "Next hunk")
			map("[h", gs.prev_hunk, "Prev hunk")
			map("<leader>hp", gs.preview_hunk, "Preview hunk")
			map("<leader>hs", gs.stage_hunk, "Stage hunk")
			map("<leader>hr", gs.reset_hunk, "Reset hunk")
			map("<leader>hb", gs.blame_line, "Blame line")
			map("<leader>hd", gs.diffthis, "Diff this file")
		end,
	},
}
