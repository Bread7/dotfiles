-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#docker_compose_language_service
return {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml.docker-compose" },
	root_markers = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
}
