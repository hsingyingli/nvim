return {
  "folke/snacks.nvim",
  keys = {
    -- { "<leader>e", false },
    -- { "<leader>E", false },
    {
      "sG",
      function()
        Snacks.picker.grep({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Grep (cwd)",
    },
    {
      "sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "sf",
      function()
        Snacks.picker.explorer()
      end,
      desc = "Explorer",
    },
    {
      "sF",
      function()
        Snacks.picker.explorer({ cwd = vim.fn.expand("%:p:h") })
      end,
      desc = "Explorer (cwd)",
    },
  },
  opts = {
    picker = {
      sources = {
        explorer = {
          jump = { close = true },
          layout = {
            cycle = false,
            preview = "true",
            layout = {
              backdrop = false,
              position = "float",
              width = 0.8,
              height = 0.8,
              border = "rounded",
              title = " Explorer ",
              title_pos = "center",
              box = "horizontal",
              {
                box = "vertical",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
              },
              { win = "preview", width = 0.6, border = "left" },
            },
          },
        },
      },
    },
  },
}
