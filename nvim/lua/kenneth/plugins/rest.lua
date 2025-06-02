return {
  "rest-nvim/rest.nvim",
  ft = "http", -- load only when an .http file is opened
    dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function (_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  keys = {
    { '<leader>rr', ':Rest run<CR>', desc = 'Rest Nvim: Run request under cursor' },
    { '<leader>rl', ':Rest last<CR>', desc = 'Rest Nvim: Run last request' },
  },

  config = function()
    -- Telescope extension
    require("telescope").load_extension("rest")

    vim.keymap.set("n", "<leader>re", function()
      require("telescope").extensions.rest.select_env()
    end, { desc = "Rest Nvim: Select Env" })
  end,
}
