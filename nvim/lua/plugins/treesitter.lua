return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "python",
        "go",
        "php",
        "tsx",
        "typescript",
        "yaml",
        "vim",
        "vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
