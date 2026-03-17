return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_maps = nil
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Add Cursor Up"] = "<C-k>",
        ["Add Cursor Down"] = "<C-j>",
      }
    end,
  },
}
