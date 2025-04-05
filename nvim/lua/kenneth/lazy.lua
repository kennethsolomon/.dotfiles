local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

require("lazy").setup({ { import = "kenneth.plugins" }, { import = "kenneth.plugins.lsp" }, { import = "kenneth.plugins.ai"} }, {
	checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
