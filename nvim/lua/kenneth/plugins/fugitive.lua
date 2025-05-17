return {
  'tpope/vim-fugitive',
  lazy = false,
  cmd = 'G',
  keys = {
    -- Status window
    { '<leader>gs', function() vim.cmd('vert Git') end, desc = 'Git status (vertical)' },

    -- Diff view
    { '<leader>gv', ':Gvdiffsplit<CR>', desc = 'Git diff split' },

    -- Blame
    { '<leader>gb', ':Git blame<CR>', desc = 'Git blame' },

    -- Log
    { '<leader>gl', ':Git log --oneline --graph --decorate<CR>', desc = 'Git log' },

    -- Commit
    { '<leader>gc', ':Git commit<CR>', desc = 'Git commit' },

    -- Push
    { '<leader>gp', ':Git push<CR>', desc = 'Git push' },

    -- Pull
    { '<leader>gP', ':Git pull<CR>', desc = 'Git pull' },

    -- Checkout branch
    { '<leader>gco', ':Git checkout ', desc = 'Git checkout branch' },

    -- Create new branch
    { '<leader>gcb', ':Git checkout -b ', desc = 'Git create branch' },

    -- Add all changes
    { '<leader>ga', ':Git add .<CR>', desc = 'Git add all' },
  }
}
