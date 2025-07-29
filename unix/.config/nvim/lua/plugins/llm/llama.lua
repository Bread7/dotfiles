return {
	"ggml-org/llama.vim",
	config = function()
		vim.g.llama_config = {
			-- default
			endpoint = "http://127.0.0.1:8012/infill",
			api_key = "",
			n_prefix = 256,
			n_suffix = 64,
			n_predict = 128,
			t_max_prompt_ms = 500,
			t_max_predict_ms = 500,
			max_line_suffix = 8,
			max_cache_keys = 250,
			ring_n_chunks = 16,
			ring_chunk_size = 64,
			ring_scope = 1024,
			ring_update_ms = 1000,
			--

			show_info = 1,
			stop_strings = {},
			keymap_trigger = "<C-F>",
			keymap_accept_full = "<S-Tab>",
			keymap_accept_line = "<C-S-CR>",
			keymap_accept_word = "<C-B>",
			auto_fim = false,
		}
		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { silent = true, desc = desc })
		end

		map({ "n" }, "<leader>L", "<cmd>LlamaToggle<cr>", "Llama: Toggle LLM")
	end,
}
