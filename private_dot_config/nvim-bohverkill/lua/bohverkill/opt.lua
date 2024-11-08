vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '-', nbsp = '+' }

-- for diagnostics
vim.opt.signcolumn = 'no'

vim.opt.spell = true
vim.opt.spelllang = { 'en', 'en_gb', 'en_us', 'de', 'de_at', 'de_de'}

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.updatetime = 50

local function trim_whitespace()
  local win_save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(win_save)
end
vim.api.nvim_create_user_command('TrimWhitespace', trim_whitespace, { nargs = 0 })

local function trim_emptylines()
  local win_save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %g/^\s*$/d]])
  vim.fn.winrestview(win_save)
end
vim.api.nvim_create_user_command('TrimEmpyLines', trim_emptylines, { nargs = 0 })

-- When editing a file, always jump to the last known cursor position.
-- Don't do it for commit messages, when the position is invalid, or when
-- inside an event handler (happens when dropping a file on gvim).
-- In addition open folds till the cursor is visible
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local line = vim.fn.line

    if vim.bo.filetype == 'gitcommit' then return end
    if line('\'"') <= 0 then return end
    if line('\'"') > line('$') then return end

    vim.cmd('normal g`"')
    vim.cmd('normal zv')
  end,
})

if vim.fn.has('persistent_undo') then
  vim.opt.undodir = os.getenv("HOME") .. '/.local/share/nvim/undo/'
  vim.opt.undofile = true
end
