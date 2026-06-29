-- My custome settings START
vim.opt.shell = "bash"

-- require('nvim-treesitter').install { 'javascript' }

vim.keymap.set("n", "<leader>w1", function()
	vim.cmd("tabnew")
	vim.cmd("term")
	vim.cmd("sp")
	vim.api.nvim_command('15 wincmd +')
	vim.cmd("term")

	vim.api.nvim_command('wincmd a')
	vim.api.nvim_command('startinsert')
end, { desc = "[t] New tab with 2 terms" })

vim.keymap.set("v", "Y", function()
	local start_pos = vim.fn.getpos("v")
	local end_pos = vim.fn.getpos(".")

	local lines = vim.fn.getregion(start_pos, end_pos)
	local str = table.concat(lines, '\n')

	vim.fn.setreg("+", str)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), 'n', true)
end, { desc = "[Y] Copy to clipboard" })

vim.keymap.set("n", "<leader>mp", function()
	local full_file_path = vim.fn.expand("%")
	vim.fn.setreg("+", full_file_path)
end, { desc = "[p] Copy current file's path to buffer" })
vim.keymap.set("n", "<leader>mP", function()
	local full_file_path = vim.fn.expand("%:p")
	vim.fn.setreg("+", full_file_path)
end, { desc = "[p] Copy current file's full path to buffer" })


vim.keymap.set("n", "<leader>mf", function()
	local file_path = vim.fn.expand("%")
	vim.fn.system("npx prettier --write " .. file_path)
	vim.cmd("e")
end, { desc = "[f] Run prettier --write command to current file"})


vim.keymap.set("n", "<leader>mb", function()
	local branch_name = vim.fn.system("git branch --show-current")
	vim.fn.setreg("+", branch_name)
end, { desc = "[b] Copy Git branch name to buffer" })


vim.keymap.set("n", "<leader>md", function()
	local file_dir = vim.fn.expand("%:h")
	vim.fn.system("mkdir -p " .. file_dir)
end, { desc = "[d] Create directory for current file" })
