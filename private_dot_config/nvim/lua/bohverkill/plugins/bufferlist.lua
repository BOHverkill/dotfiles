return {
	"kilavila/nvim-bufferlist",

	config = function()
		local bufferlist = require('nvim-bufferlist')

		vim.keymap.set('n', '<leader>bl', bufferlist.bufferlist)
	end
}
