return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true, -- 這會讓過濾的項目以暗淡的方式顯示
          hide_dotfiles = false, -- 不隱藏 dotfiles (.bashrc, .gitignore 等)
          hide_gitignored = false, -- 不隱藏 git ignored 檔案
          hide_hidden = false, -- 不隱藏隱藏檔案 (Windows)
        },
      },
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
}
