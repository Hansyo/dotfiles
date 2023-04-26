-- null ls
require('null-ls').setup({
	diagnostics_format = "#{m} (#{s}: #{c})",
})

require('mason-null-ls').setup({
	handlers = {}, -- `automatic_setup`を正しく動作させるためには、`handlers`が空である必要がある？
})

