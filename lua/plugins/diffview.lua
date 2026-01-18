return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<Leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
    { "<Leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<Leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
  },
  opts = {},
}
