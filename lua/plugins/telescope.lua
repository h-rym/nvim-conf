return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    { "<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<Leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<Leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<Leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          preview_width = 0.5,
        },
      },
    },
  },
}
