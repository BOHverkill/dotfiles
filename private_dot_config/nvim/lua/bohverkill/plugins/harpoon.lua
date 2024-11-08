return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local harpoon = require('harpoon')

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end)
		vim.keymap.set('n', '<leader>hl', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set('n', '<leader>hp', function() harpoon:list():prev() end)
		vim.keymap.set('n', '<leader>hn', function() harpoon:list():next() end) 
	end
}
