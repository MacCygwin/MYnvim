-- Mason: ensures servers are installed
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright", "clangd", "cssls" }
})

-- Keymaps when LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local opts = { buffer = bufnr }

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end
})

-- Optional: merge cmp capabilities into default LSP caps
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Use vim.lsp.config to configure servers
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
    },
  },
})

vim.lsp.config("pyright", { capabilities = capabilities })

vim.lsp.config("clangd", { capabilities = capabilities })

vim.lsp.config("cssls", { capabilities = capabilities })

-- Enable the servers so they auto‑start 
vim.lsp.enable({ "lua_ls", "pyright", "clangd", "cssls" })

