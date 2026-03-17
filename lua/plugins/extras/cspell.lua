return {
  "nvimtools/none-ls.nvim",
  dependencies = "davidmh/cspell.nvim",
  config = function()
    local null_ls = require("null-ls")
    local cspell = require("cspell")
    local cspell_config = {
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity["ERROR"] -- ERROR, WARN, INFO, HINT
      end,
      config = {
        find_json = function(_)
          return vim.fn.expand("~/.config/nvim/lua/aaron/configs/cspell.json")
        end,
        on_success = function(cspell_config_file_path, _, action_name)
          if action_name == "add_to_json" then
            local tmp_file = cspell_config_file_path .. ".tmp"
            local cmd = string.format(
              "jq -S '.words |= sort' %s > %s && mv %s %s",
              cspell_config_file_path,
              tmp_file,
              tmp_file,
              cspell_config_file_path
            )
            os.execute(cmd)
          end
        end,
      },
    }
    null_ls.setup({
      sources = {
        cspell.diagnostics.with(cspell_config),
        cspell.code_actions.with(cspell_config),
      },
    })
  end,
}
