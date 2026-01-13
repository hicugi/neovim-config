-- My custome settings START
vim.opt.shell = "bash"

vim.keymap.set("n", "<leader>w1", function()
	vim.cmd("tabnew")
	vim.cmd("term")
	vim.cmd("vs")
	vim.cmd("term")

	vim.api.nvim_command('wincmd h')
	vim.api.nvim_command('startinsert')
end, { desc = "[t] New tab with 2 terms" })


-- Copy relative path
vim.keymap.set("n", "<leader>mp", function()
	local full_file_path = vim.fn.expand("%")
	vim.fn.setreg("+", full_file_path)
end, { desc = "[p] Copy current file's path to buffer" })
-- Copy full path
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
