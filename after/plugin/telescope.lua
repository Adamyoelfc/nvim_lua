local builtin = require('telescope.builtin')
vim.keymap.set('n', '.fi', builtin.find_files, {})
vim.keymap.set('n', '.e', builtin.git_files, {})
vim.keymap.set('n', '.b', builtin.buffers, {})
vim.keymap.set('n', '.km', builtin.keymaps, {})

-- vim.keymap.set('n', '.ff', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") });
-- end)

vim.keymap.set('n', '.ff', builtin.live_grep, {})
