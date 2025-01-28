require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
-- local nmap = vim.api.nvim_set_keymap

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>ww", ":w<CR>", { desc = "Save File" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local copy_file_path = function()
  local path = vim.fn.expand "%:p"
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end

map("n", "<leader>fp", copy_file_path, { noremap = true, silent = true, desc = "Copy [F]ile [P]ath" })

-- Debugging/DAP related mappings
map("n", "<F5>", require("dap").continue)
map("n", "<F10>", require("dap").step_over)
map("n", "<F11>", require("dap").step_into)
map("n", "<F12>", require("dap").step_out)
map("n", "<Leader>db", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
map("n", "<Leader>dB", require("dap").clear_breakpoints, { desc = "Clear Breakpoints" })
map({ "n", "v" }, "<Leader>dh", require("dap.ui.widgets").hover)
map({ "n", "v" }, "<Leader>dp", require("dap.ui.widgets").preview)
map("n", "<Leader>df", function()
  local widgets = require "dap.ui.widgets"
  widgets.centered_float(widgets.frames)
end)
