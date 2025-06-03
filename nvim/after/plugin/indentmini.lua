-- Colors are applied automatically based on user-defined highlight groups.
-- There is no default value.
vim.cmd.highlight('IndentLine guifg=#1C1E26')
-- Current indent line highlight
vim.cmd.highlight('IndentLineCurrent guifg=#7F8490')


require("indentmini").setup({
  exclude = {"markdown"},
  minlevel = 2,
  only_current = true,
}) -- use default config
