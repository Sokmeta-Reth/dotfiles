return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "<C-n>", "<cmd>Neotree toggle right<cr>", desc = "Toggle file tree (right)" },
  },
  opts = {
    window = { position = "right" },
  },
}
