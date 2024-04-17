local function open_temp_buf_in_win(opts)
	-- NOTE: create buffer for window
	local b = vim.api.nvim_create_buf(false, false)
	-- NOTE:
	-- set buffer type to scratch type
	-- so nvim won't ask you to save it
	-- :help special-buffers
	-- vim.api.nvim_buf_set_name(b, "temp")
	vim.api.nvim_buf_set_option(b, "buftype", "nofile")
	vim.api.nvim_buf_set_option(b, "bufhidden", "hide")
	-- set buffer text
	vim.api.nvim_buf_set_lines(b, 0, 0, false, { "hello", "world" })

	-- set keymap for easy quit
	vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = b })
	vim.keymap.set("n", "<leader>q", "<cmd>close<cr>", { buffer = b })

	if opts == nil then
		opts = {
			split = "v",
			attach = true,
		}
	end

	-- NOTE: save current window id
	local o_win = vim.api.nvim_get_current_win()
	-- NOTE: create window
	if opts.split == "v" then
		vim.cmd("vsplit")
	else
		vim.cmd("split")
	end
	-- NOTE: get new win id
	local w = vim.api.nvim_get_current_win()
	-- NOTE: set window's buffer
	vim.api.nvim_win_set_buf(w, b)
	if not opts.attach then
		vim.api.nvim_set_current_win(o_win)
	else
		vim.api.nvim_set_current_win(w)
	end
end

vim.keymap.set("n", "<leader>o", function()
	open_temp_buf_in_win({ split = "h", attach = false })
end)

vim.keymap.set("n", "<leader>O", function()
	open_temp_buf_in_win({ split = "v", attach = true })
end)
