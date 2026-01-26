return {
  dir = ".",
  name = "docsify",
  keys = {
    {
      "<Leader>md",
      function()
        -- gitリポジトリのルートを取得
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error ~= 0 or not git_root then
          vim.notify("Git repository not found", vim.log.levels.ERROR)
          return
        end
        local nvim_dir = vim.fn.expand("~/.config/nvim")
        local docsify_bin = nvim_dir .. "/node_modules/.bin/docsify"
        local docsify_dir = git_root .. "/.docsify"
        local index_html = docsify_dir .. "/index.html"

        -- ディレクトリパスからポート番号を生成（3000-3999の範囲）
        local function get_port(path)
          local sum = 0
          for i = 1, #path do
            sum = sum + string.byte(path, i)
          end
          return 3000 + (sum % 1000)
        end

        -- .docsifyディレクトリとindex.htmlを作成
        if vim.fn.isdirectory(docsify_dir) == 0 then
          vim.fn.mkdir(docsify_dir, "p")
        end

        if vim.fn.filereadable(index_html) == 0 then
          local html = [[<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/docsify/themes/vue.css">
</head>
<body>
  <div id="app"></div>
  <script>
    window.$docsify = {
      basePath: '../',
      loadSidebar: true,
      auto2top: true,
      mermaidConfig: { theme: 'default' },
    }
  </script>
  <script src="//cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/mermaid/dist/mermaid.min.js"></script>
  <script src="//cdn.jsdelivr.net/npm/docsify-mermaid@2.0.0/dist/docsify-mermaid.js"></script>
  <script type="module" src="https://cdn.jsdelivr.net/npm/docsify-livereload/dist/index.min.js"></script>
</body>
</html>]]
          vim.fn.writefile(vim.split(html, "\n"), index_html)
        end

        local port = get_port(git_root)

        vim.fn.jobstart({ docsify_bin, "serve", docsify_dir, "--port", tostring(port) }, { detach = true })
        vim.defer_fn(function()
          vim.fn.jobstart({ "open", "http://localhost:" .. port }, { detach = true })
        end, 1000)
        vim.notify("Docsify started on port " .. port, vim.log.levels.INFO)
      end,
      desc = "Docsify プレビュー起動",
    },
  },
}
