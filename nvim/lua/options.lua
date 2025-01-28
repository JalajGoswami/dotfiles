require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.opt.relativenumber = true
vim.opt.smartindent = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    -- ["+"] = "clip.exe",
    -- ["*"] = "clip.exe",
    ["+"] = "win32yank.exe -i",
    ["*"] = "win32yank.exe -i",
  },
  paste = {
    -- ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    -- ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["+"] = "win32yank.exe -o",
    ["*"] = "win32yank.exe -o",
  },
  cache_enabled = 0,
}
