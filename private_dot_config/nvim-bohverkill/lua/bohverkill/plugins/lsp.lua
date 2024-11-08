return {
	'neovim/nvim-lspconfig',
	dependencies = {
		-- LSP support
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',

		-- LSP notifications
		{ 'j-hui/fidget.nvim', opts = {} },

		-- Autocomplete
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		local capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities())

		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = { 'lua_ls', 'rust_analyzer', 'ltex' , 'gopls'},

			handlers = {
				function(server_name) -- default handler (optional)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities
					}
				end,
				lua_ls = function()
					require('lspconfig').lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = 'LuaJit' },
								diagnostics = {
									globals = { 'vim' },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME
									}
								}
							}
						}
					})
				end,
				-- ltex = function()
				-- 	require('lspconfig').ltex.setup({
				-- 		-- capabilities = capabilities,
				-- 		settings = {
				-- 			ltex = {
				-- 				-- language = 'en-GB',
				-- 				java = {
				-- 					path = '/usr/lib/jvm/java-11-openjdk/'
				-- 				}
				-- 			}
				-- 		}
				-- 	})
				-- end
			}
		})

		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('bohverkill-lsp-attach', { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf }
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', 'gR', function() require('telescope.builtin').lsp_references() end, opts) -- TODO add dependency
				vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', 'gI', function() require('telescope.builtin').lsp_implementations() end, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			end
		})
	end
}
