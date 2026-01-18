return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<Leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
    { "<Leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<Leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix (Trouble)" },
    { "<Leader>xf", "<cmd>Trouble focus<cr>", desc = "Focus Trouble" },
  },
  opts = {},
}
