return {
  "akinsho/git-conflict.nvim",
  event = "VeryLazy",
  config = function()
    require("git-conflict").setup({
      default_mappings = {
        ours = "<leader>co",
        theirs = "<leader>ct",
        none = "<leader>cn",
        both = "<leader>cb",
        split = "<leader>cs",
        help = "<leader>ch",
      },
      default_commands = true,
      auto_apply = false,
      auto_skip_merge = false,
    })
  end,
}
