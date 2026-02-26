-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- require('lspconfig').harper_ls.setup {}
vim.opt.swapfile = false

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
})
