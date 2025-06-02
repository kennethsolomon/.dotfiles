-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Center the view when using ctrl d and ctrl u
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")


keymap.set('n', '<leader>sr', function()
  local from = vim.fn.input("Replace: ")
  if from == "" then return end
  local to = vim.fn.input("With: ")
  if to == "" then return end
  vim.cmd(':%s/' .. from .. '/' .. to .. '/g')
end, { desc = "Substitute text dynamically", noremap = true, silent = false })

keymap.set('n', '<leader>sR', function()
  local from = vim.fn.input("Replace: ")
  if from == "" then return end
  local to = vim.fn.input("With: ")
  if to == "" then return end
  vim.cmd(':%s/' .. from .. '/' .. to .. '/gi')
end, { desc = "Case-insensitive global replace", noremap = true })

keymap.set('n', '<leader>nf', function()
  local name = vim.fn.input("New file name: ")
  if name ~= "" then
    vim.cmd('edit ' .. name)
  end
end, { desc = "Create new file", noremap = true })
