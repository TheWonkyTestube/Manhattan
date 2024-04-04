require 'colorizer'.setup()

require("auto-save").setup{}

require('nvim-autopairs').setup()

require('nvim_comment').setup()

require'nvim-treesitter.configs'.setup{
  ensure_installed = {"help"},
  auto_install = true,
  highlight ={
	enable = true,
  },
}

require"surround".setup {
  context_offset = 100,
  load_autogroups = false,
  mappings_style = "sandwich",
  map_insert_mode = true,
  quotes = {"'", '"'},
  brackets = {"(", '{', '['},
  space_on_closing_char = false,
  pairs = {
    nestable = { s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
    linear = { b = {"*", "*" }, q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } }
  },
  prefix = "s"
}
