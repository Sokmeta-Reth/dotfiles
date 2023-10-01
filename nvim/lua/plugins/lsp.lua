return {
  {
    -- mason installs the servers, mason-lspconfig hands each one to lspconfig
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- server name -> settings
      local servers = {
        lua_ls = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
        gopls = {},
        pyright = {}, -- types
        ruff_lsp = {}, -- lint
        tsserver = {},
        html = {},
        cssls = {},
        jsonls = {},
        yamlls = {},
        bashls = {},
        intelephense = {}, -- php
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
      require("mason-lspconfig").setup_handlers({
        function(server)
          require("lspconfig")[server].setup({
            capabilities = capabilities,
            settings = servers[server],
          })
        end,
      })

      vim.diagnostic.config({
        virtual_text = true,
        severity_sort = true,
        float = { border = "rounded", source = "always" },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local function map(lhs, fn, desc)
            vim.keymap.set("n", lhs, fn, { buffer = ev.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Goto definition")
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          map("gy", vim.lsp.buf.type_definition, "Goto type definition")
          map("gr", vim.lsp.buf.references, "References")
          map("gi", vim.lsp.buf.implementation, "Goto implementation")
          map("K", vim.lsp.buf.hover, "Hover")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
        end,
      })
    end,
  },
}
