-- See: https://vi.stackexchange.com/questions/43519/docker-compose-lsp-will-not-attach-to-buffer-nor-automatically-start
-- See: https://stackoverflow.com/questions/7000100/the-autocmd-pattern-to-match-filename-and-part-of-path-in-vim
local function set_filetype(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		command = "set filetype=" .. filetype,
	})
end

set_filetype({ "**compose**.yml", "**compose**.yaml" }, "yaml.docker-compose")
