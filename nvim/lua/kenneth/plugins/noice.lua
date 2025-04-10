return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- any Noice options go here
  },
  config = function(_, opts)
    require("noice").setup(opts)

    -- Keymap to dismiss notifications using the command
    vim.keymap.set("n", "<leader>nd", function()
      vim.cmd("NoiceDismiss")
    end, { desc = "Dismiss Noice notifications" })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
