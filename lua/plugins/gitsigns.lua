return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    current_line_blame = true,
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local opts = { buffer = bufnr }

      -- Navigation
      vim.keymap.set("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, opts)

      vim.keymap.set("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, opts)

      -- Actions
      vim.keymap.set("n", "<Leader>gs", gitsigns.stage_hunk, opts)
      vim.keymap.set("n", "<Leader>gr", gitsigns.reset_hunk, opts)
      vim.keymap.set("v", "<Leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, opts)
      vim.keymap.set("v", "<Leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, opts)
      vim.keymap.set("n", "<Leader>gS", gitsigns.stage_buffer, opts)
      vim.keymap.set("n", "<Leader>gu", gitsigns.undo_stage_hunk, opts)
      vim.keymap.set("n", "<Leader>gR", gitsigns.reset_buffer, opts)
      vim.keymap.set("n", "<Leader>gp", gitsigns.preview_hunk, opts)
      vim.keymap.set("n", "<Leader>gb", function()
        gitsigns.blame_line({ full = true })
      end, opts)
      vim.keymap.set("n", "<Leader>gB", gitsigns.toggle_current_line_blame, opts)
      vim.keymap.set("n", "<Leader>gd", gitsigns.diffthis, opts)

      -- Text object
      vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
    end,
  },
}
