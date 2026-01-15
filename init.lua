-- リーダーキー
vim.g.mapleader = " "

-- 行番号を表示
vim.opt.number = true

-- 相対行番号を表示
vim.opt.relativenumber = true 

-- クリップボード連携 (MacのCommand+C/Vと共有するのに必須)
vim.opt.clipboard = "unnamedplus"

-- インデント設定 (スペース2つ分)
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- 検索時に大文字小文字を区別しない
vim.opt.ignorecase = true
-- 検索パターンに大文字を含む時は区別する
vim.opt.smartcase = true

-- マウス操作を有効にする
vim.opt.mouse = "a"

-- keymap
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('v', 'jk', '<Esc>')

-- lazy.nvim
require("config.lazy")

