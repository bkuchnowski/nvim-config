-- load defaults i.e lua_lsp
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.servers = {
    "basedpyright",
    "clangd",
    "lua_ls",
    "ruff",
}
-- lsps with default config
local default_servers = {"lua_ls"}

for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end


lspconfig.basedpyright.setup({
  basedpyright = {
    analysis = {
      autoSearchPaths = true,
      diagnosticMode = "openFilesOnly",
      typeCheckingMode = "off",
      useLibraryCodeForTypes = true
    }
  }
})

lspconfig.clangd.setup({
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
    end,
    on_init = on_init,
    capabilities = capabilities,
})

lspconfig.ruff.setup({
  trace = 'messages',
  init_options = {
    settings = {
      logLevel = 'debug',
    }
  }
})
