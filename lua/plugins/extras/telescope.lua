return {
  {
    "nvim-telescope/telescope.nvim", -- 修正：使用完整的 GitHub 路徑
    dependencies = {
      "nvim-lua/plenary.nvim", -- 添加：必要的依賴
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make", -- 添加：構建命令
      },
      "nvim-telescope/telescope-file-browser.nvim",
      "princejoogie/dir-telescope.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        ";r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
      {
        "sg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "grep",
      },
      {
        "sgd",
        function()
          require("telescope").extensions.dir.live_grep({})
        end,
      },
      {
        "gf",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files()
        end,
        desc = "global",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      -- 添加安全檢查
      local success, fb_actions = pcall(function()
        return require("telescope").extensions.file_browser.actions
      end)
      if not success then
        fb_actions = {}
      end

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })

      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }

      opts.extensions = {
        dir = {
          hidden = true,
          no_ignore = true,
          show_preview = true,
        },
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              ["C"] = fb_actions.create or function() end,
              ["R"] = fb_actions.rename or function() end,
              ["D"] = fb_actions.remove or function() end,
              ["Y"] = fb_actions.copy or function() end,
              ["M"] = fb_actions.move or function() end,
              ["h"] = fb_actions.goto_parent_dir or function() end,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }

      telescope.setup(opts)

      -- -- 添加安全的擴展載入
      pcall(function()
        require("telescope").load_extension("fzf")
      end)
      pcall(function()
        require("telescope").load_extension("file_browser")
      end)
      pcall(function()
        require("telescope").load_extension("dir")
      end)
    end,
  },
}
