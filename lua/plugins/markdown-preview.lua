return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = ":call mkdp#util#install()",
  ft = { "markdown" },
  keys = {
    { "<Leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "プレビュー切替" },
  },
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_auto_start = 1           -- ファイルを開いたら自動プレビュー
    vim.g.mkdp_auto_close = 0           -- バッファ閉じてもプレビュー維持
    vim.g.mkdp_refresh_slow = 0         -- リアルタイム更新
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_preview_options = {
      mermaid = { theme = "dark" },
    }
  end,
}
