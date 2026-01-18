return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<Leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
    { "<Leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<Leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch history" },
  },
  opts = {
    keymaps = {
      view = {
        { "n", "<leader>e", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
      },
      file_panel = {
        { "n", "<leader>e", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
      },
    },
  },
}
