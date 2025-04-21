-- Key mappings

-- General mappings
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Quickly switch from insert mode to normal mode' })
vim.keymap.set('n', '<Leader>w', ':w<CR>')
vim.keymap.set('n', '<Leader>x', ':bd<CR>', { noremap = true, silent = true, desc = 'Close current buffer' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<Leader>k', '<C-w>o', { desc = 'Close all split windows except the current one' })

-- Window resizing
vim.keymap.set('n', '<A-h>', '<C-w>2<', { noremap = true, silent = true, desc = 'Resize window left' })
vim.keymap.set('n', '<A-l>', '<C-w>2>', { noremap = true, silent = true, desc = 'Resize window right' })
vim.keymap.set('n', '<A-k>', '<C-w>2+', { noremap = true, silent = true, desc = 'Resize window up' })
vim.keymap.set('n', '<A-j>', '<C-w>2-', { noremap = true, silent = true, desc = 'Resize window down' })

-- Disable arrow keys with helpful reminders
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Buffer management
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bo', function()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and buf ~= current_buf then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { noremap = true, silent = true, desc = 'Close all buffers except current' })

-- Toggle features
vim.keymap.set('n', '<leader>tw', function()
  vim.wo.wrap = not vim.wo.wrap
end, { noremap = true, silent = true, desc = 'Toggle line wrapping' })

-- File explorer
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
vim.keymap.set('n', '<Leader>tf', ':NvimTreeFindFile<CR>', { noremap = true, silent = true, desc = 'Find current file on file tree' })

-- Lazydocker
vim.keymap.set('n', '<Leader>ld', '<cmd>LazyDocker<CR>', { noremap = true, silent = true, desc = 'Toggle LazyDocker' })

-- Create a split window
vim.keymap.set('n', '<Leader>vs', '<cmd>vs<CR>', { noremap = true, silent = true, desc = 'Toggle LazyDocker' })
