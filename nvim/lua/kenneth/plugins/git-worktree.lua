return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    require("telescope").load_extension("git_worktree")

    vim.keymap.set("n", "<leader>gw", function()
      require("telescope").extensions.git_worktree.git_worktrees()
    end, { desc = "Git Worktree: List worktrees" })

    vim.keymap.set("n", "<leader>gW", function()
      require("telescope").extensions.git_worktree.create_git_worktree()
    end, { desc = "Git Worktree: Create new worktree" })
  end,
}
