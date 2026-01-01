-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'tpope/vim-fugitive',
    event = 'VimEnter',
    config = function()
      -- Git status / :G
      vim.keymap.set('n', '<Leader>gs', ':G<CR>', { noremap = true, silent = true, desc = 'Open [S]tatus' }) -- open :G (status)

      -- Git commit
      vim.keymap.set('n', '<Leader>gc', ':G commit<CR>', { noremap = true, silent = true, desc = 'Start [C]ommit' }) -- start commit (opens Fugitive commit buffer)
      vim.keymap.set('n', '<Leader>gC', ':G commit --amend<CR>', { noremap = true, silent = true, desc = 'Amend [C]ommit' }) -- amend last commit

      -- Git add / stage
      vim.keymap.set('n', '<Leader>ga', ':Gwrite<CR>', { noremap = true, silent = true, desc = '[A]dd File' }) -- stage current file (:%Gwrite in fugitive buffers)
      vim.keymap.set('v', '<Leader>ga', ':Gwrite<CR>', { noremap = true, silent = true, desc = 'Visual [G]it [A]dd' }) -- stage visually selected file hunks (works in fugitive buffers)

      -- Git diff and hunk actions (works in Gdiff / buffer)
      vim.keymap.set('n', '<Leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true, desc = '[D]iff' }) -- open diff for current file
      vim.keymap.set('n', '<Leader>gr', ':Gread<CR>', { noremap = true, silent = true, desc = 'Reset to Staged/Commit' }) -- checkout changes from index/HEAD into buffer

      -- Git blame
      vim.keymap.set('n', '<Leader>gb', ':G blame<CR>', { noremap = true, silent = true, desc = '[B]lame' }) -- open git blame for current file

      -- Git log / browse history
      vim.keymap.set('n', '<Leader>gl', ':G log --oneline<CR>', { noremap = true, silent = true, desc = '[L]og' }) -- show file/buffer log

      -- Git push / pull (open terminal for interactive)
      vim.keymap.set('n', '<Leader>gP', ':!git push<CR>', { noremap = true, silent = true, desc = '[P]ush' }) -- push current branch
      vim.keymap.set('n', '<Leader>gp', ':!git pull --rebase<CR>', { noremap = true, silent = true, desc = '[P]ull --rebase' }) -- pull with rebase

      -- Git checkout / switch branch
      vim.keymap.set('n', '<Leader>gbn', ':G checkout -b ', { noremap = true, silent = false, desc = 'Switch -c' }) -- start typed branch create
      vim.keymap.set('n', '<Leader>gbs', ':G checkout ', { noremap = true, silent = false, desc = 'Checkout' }) -- start typed branch switch

      -- Open fugitive help quickly
      vim.keymap.set('n', '<Leader>gh', ':help fugitive<CR>', { noremap = true, silent = true, desc = '[H]elp' })
    end,
  },
}
