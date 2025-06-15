return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup()

    -- languages you want parsers for; nvim already bundles
    -- c, lua, markdown, markdown_inline, query, vim, vimdoc
    local ensure = {
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
    }

    local installed = require("nvim-treesitter.config").get_installed("parsers")
    local missing = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, ensure)
    if #missing > 0 then
      require("nvim-treesitter").install(missing)
    end

    -- main branch does NOT enable highlighting; scope it to the filetypes
    -- we have parsers for, per the README
    local filetypes = vim.iter(ensure)
      :map(function(lang)
        return vim.treesitter.language.get_filetypes(lang)
      end)
      :flatten()
      :totable()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = filetypes,
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
