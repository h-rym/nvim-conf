return {
  dir = ".",
  name = "docsify",
  keys = {
    {
      "<Leader>md",
      function()
        local cwd = vim.fn.getcwd()
        local nvim_dir = vim.fn.expand("~/.config/nvim")
        local docsify_bin = nvim_dir .. "/node_modules/.bin/docsify"

        -- ディレクトリパスからポート番号を生成（3000-3999の範囲）
        local function get_port(path)
          local sum = 0
          for i = 1, #path do
            sum = sum + string.byte(path, i)
          end
          return 3000 + (sum % 1000)
        end

        local port = get_port(cwd)

        vim.fn.jobstart({ docsify_bin, "serve", cwd, "--port", tostring(port) }, { detach = true })
        vim.defer_fn(function()
          vim.fn.jobstart({ "open", "http://localhost:" .. port }, { detach = true })
        end, 1000)
        vim.notify("Docsify started on port " .. port, vim.log.levels.INFO)
      end,
      desc = "Docsify プレビュー起動",
    },
  },
}
