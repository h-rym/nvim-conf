return {
  "okuuva/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = false,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = { "InsertLeave", "TextChanged" },
      cancel_deferred_save = { "InsertEnter" },
    },
    debounce_delay = 1000,
  },
  config = function(_, opts)
    require("auto-save").setup(opts)

    -- 保存時にメッセージを表示（カスタム実装）
    vim.api.nvim_create_autocmd("User", {
      pattern = "AutoSaveWritePost",
      callback = function()
        vim.notify("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"), vim.log.levels.INFO)
      end,
    })
  end,
}
