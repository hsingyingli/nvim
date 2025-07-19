return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ruby_lsp = {
        --   mason = false, -- 不使用 mason 安裝 ruby_ls
        --   cmd = { "/users/aaron/.rbenv/versions/3.2.3/bin/ruby", "/users/aaron/.rbenv/versions/3.2.3/bin/ruby-lsp" },
        --   settings = {
        --     cmd = { "ruby-lsp" }, -- 使用 ruby-lsp 命令
        --     formatter = "rubocop", -- 關閉 ruby-ls 的格式化，交給 rubocop 處理
        --     linter = "rubocop", -- 使用 rubocop 作為 linter
        --   },
        -- },
        solargraph = {
          mason = false, -- 不使用 Mason 安裝
          cmd = { "solargraph", "stdio" }, -- 使用系統安裝
          settings = {
            solargraph = {
              diagnostics = true, -- 確保診斷功能開啟
              formatting = true, -- 禁用格式化
            },
          },
        },
        rubocop = {
          -- If Solargraph and Rubocop are both enabled as an LSP,
          -- diagnostics will be duplicated because Solargraph
          -- already calls Rubocop if it is installed
          enabled = false,
        },
        stylelint_lsp = {
          settings = {
            stylelintplus = {
              autoFixOnSave = true,
              autoFixOnFormat = true,
              -- other settings...
            },
          },
        },
        cssls = {},
        -- ruby_ls = {
        --   -- 如果需要自定義設置
        --   settings = {
        --     formatter = "none", -- 關閉 ruby-ls 的格式化，交給 rubocop 處理
        --   },
        -- },
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                -- formatter options
                black = { enabled = true },
                autopep8 = { enabled = false },
                yapf = { enabled = false },

                -- linter options
                --pylint = { enabled = true, executable = "pylint" },
                pyflakes = { enabled = true },
                pycodestyle = { enabled = false },

                -- type checker
                pylsp_mypy = { enabled = false },

                -- auto-completion options
                jedi_completion = { fuzzy = true },

                -- import sorting
                pyls_isort = { enabled = true },
              },
            },
          },
        },
      },
    },
  },
}
