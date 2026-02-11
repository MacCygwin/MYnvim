require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
vim.wo.number = true  -- Enable absolute line numbers
vim.wo.relativenumber = true -- Enable relative line numbers
vim.diagnostic.enable = true
vim.diagnostic.config({
  virtual_lines = true,
})
