return {
  'tpope/vim-fugitive',
  lazy = false,
  cmd = 'G',
  keys = {
    { '<leader>gs', function() vim.cmd('vert Git') end, desc = 'git fugitive' },
    { '<leader>gv', ':Gvdiffsplit ',                    desc = 'git diff split' },
    { '<leader>gb', ':Git blame ',                    desc = 'git blame' },
  }
}
