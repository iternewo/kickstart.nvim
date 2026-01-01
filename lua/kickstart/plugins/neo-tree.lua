-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { 'E', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>e', ':Neotree git_status<CR>', desc = 'Neotree Git Status', silent = true },
  },
  opts = {
    enable_git_status = true,
    git_status = {
      window = {
        position = 'float',
        mappings = {
          ['A'] = 'git add all',
          ['gu'] = 'git unstage file',
          ['ga'] = 'git add file',
          ['gr'] = 'git revert file',
          ['gc'] = 'git commit',
          ['gp'] = 'git push',
          ['gg'] = 'git commit and push',
        },
      },
    },
    close_if_last_window = true,
    filesystem = {
      bind_to_cwd = true,
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
