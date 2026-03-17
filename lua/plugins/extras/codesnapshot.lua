return {
  {
    "mistricky/codesnap.nvim",
    build = "make build_generator",
    keys = {
      { "<leader>sc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>sf", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Desktop" },
    },
    opts = {
      save_path = "~/Desktop",
      has_breadcrumbs = true,
      bg_theme = "sea",
    },
  },
}
