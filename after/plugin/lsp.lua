local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	'tsserver',
	'eslint',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		 -- `Enter` key to confirm completion
	    ['<CR>'] = cmp.mapping.confirm({select = true}),

	    -- Ctrl+Space to trigger completion menu
	    ['<C-Space>'] = cmp.mapping.complete(),

	    -- Navigate between snippet placeholder
	    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
	    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

	    -- Scroll up and down in the completion documentation
	    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
	    ['<C-d>'] = cmp.mapping.scroll_docs(4),
	})
})

lsp_zero.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.dignostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.dignostic.goto_next() end, opts)
	vim.keymap.set("n", "d]", function() vim.dignostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup({})
require('lspconfig').rust_analyzer.setup({})

