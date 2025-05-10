return {
  {
    -- mason installs the servers; nvim-lspconfig only supplies their
    -- config definitions (lsp/*.lua), which vim.lsp.config finds itself
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua_ls",
        "gopls",
        "basedpyright", -- types
        "ruff", -- lint + format
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "bashls",
        "intelephense", -- php
      },
      -- automatic_enable defaults to true: every installed server is
      -- handed to vim.lsp.enable() for us, so no setup{} calls needed
    },
    config = function(_, opts)
      -- per-server overrides, merged onto nvim-lspconfig's definitions
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      require("mason-lspconfig").setup(opts)

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded", source = true },
      })

      -- 0.11+ already maps grn (rename), gra (code action), grr
      -- (references), gri (implementation), gO (symbols) and K (hover);
      -- these are the ones it does not provide
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local function map(lhs, fn, desc)
            vim.keymap.set("n", lhs, fn, { buffer = ev.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Goto definition")
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          map("gy", vim.lsp.buf.type_definition, "Goto type definition")
          map("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
        end,
      })
    end,
  },
}
