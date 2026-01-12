-- ================================
-- Core imports
-- ================================
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ================================
-- Mason
-- ================================
mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "pyright",
    "ts_ls",
    "lua_ls",
    "clangd",
    "rust_analyzer",
    "gopls",
    "html",
    "cssls",
    "eslint",
    "jdtls",
    "harper_ls",
  },
})

-- ================================
-- on_attach (keymaps + format on save)
-- ================================
local on_attach = function(client, bufnr)
  local map = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "[d", vim.diagnostic.goto_prev)
  map("n", "]d", vim.diagnostic.goto_next)

  -- Format on save (only if supported)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ async = false })
      end,
    })
  end
end

-- ================================
-- Default servers
-- ================================
local servers = {
  "pyright",
  "ts_ls",
  "clangd",
  "rust_analyzer",
  "html",
  "cssls",
  "eslint",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- ================================
-- gopls (Go with custom settings)
-- ================================
lspconfig.gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      gofumpt = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
      },
    },
  },
})

-- ================================
-- Lua (Neovim globals)
-- ================================
lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- ================================
-- jdtls (separate)
-- ================================
local home = os.getenv("HOME")
local workspace_dir = home .. "/.cache/jdtls/workspace"

lspconfig.jdtls.setup({
  cmd = { "jdtls", "-data", workspace_dir },
  root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", ".git"),
  capabilities = capabilities,
  on_attach = on_attach,
})

-- ================================
-- harper_ls (markdown / text only)
-- ================================
lspconfig.harper_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "markdown", "text" },
})
