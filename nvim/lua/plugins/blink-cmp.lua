return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*", -- use a release tag to download pre-built binaries
  event = "InsertEnter",
  opts = {
    -- default preset: <C-y> accepts, <C-n>/<C-p> cycle, <C-e> hides,
    -- <C-space> toggles docs. All insert mode, so they do not collide
    -- with the normal-mode <C-n>/<C-k> maps you already have.
    keymap = { preset = "default" },
    appearance = { nerd_font_variant = "mono" },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
