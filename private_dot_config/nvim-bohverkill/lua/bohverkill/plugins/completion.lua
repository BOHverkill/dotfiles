return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',

		{
			'L3MON4D3/LuaSnip',
			-- follow latest release.
			version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = 'make install_jsregexp',
			dependencies = {
				{
					'rafamadriz/friendly-snippets',
					config = function()
						require('luasnip.loaders.from_vscode').lazy_load()
					end,
				}
			}
		},
		'saadparwaiz1/cmp_luasnip'
	},
	config = function()
		local cmp = require('cmp')
		local luasip = require('luasnip')

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					luasip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-q>'] = cmp.mapping.abort(),
				-- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				-- ['<Tab>'] = cmp.mapping(function(fallback)
				-- 	-- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
				-- 	if cmp.visible() then
				-- 		local entry = cmp.get_selected_entry()
				-- 		if not entry then
				-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 		end
				-- 		cmp.confirm()
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, {'i','s','c',}),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}, {
					{ name = 'buffer' },
				})
		})
	end
}
