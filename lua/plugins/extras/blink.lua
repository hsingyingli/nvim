return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      fuzzy = {
        implementation = "lua",
      },
      keymap = {
        preset = "default", -- 或 "super-tab"

        -- 自定義按鍵
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        -- 或者使用 super-tab 預設
        -- ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        -- ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },

        ["<CR>"] = { "accept", "fallback" },
        ["<C-space>"] = { "show", "fallback" },
      },
    },
  },
}
