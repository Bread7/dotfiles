---@return table

return {
	-- https://wezfurlong.org/wezterm/config/lua/SshDomain.html
	ssh_domains = {
		-- {
		-- name = 'my.server', -- Identifies the domain
		-- remote_address = '192.168.1.1', -- Used to match settings from ssh config file
		-- username = 'bread', -- Username on remote host
		-- }
	},

	-- https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
	unix_domains = {
		-- {
		-- The name; must be unique amongst all domains
		-- name = 'unix',

		-- The path to the socket.  If unspecified, a resonable default
		-- value will be computed.

		-- socket_path = "/some/path",

		-- If true, do not attempt to start this server if we try and fail to
		-- connect to it.

		-- no_serve_automatically = false,

		-- If true, bypass checking for secure ownership of the
		-- socket_path.  This is not recommended on a multi-user
		-- system, but is useful for example when running the
		-- server inside a WSL container but with the socket
		-- on the host NTFS volume.

		-- skip_permissions_check = false,

		-- Used in place of making a direct unix connection
		-- proxy_command = { 'nc', '-U', '/Users/zj/.local/share/wezterm/sock'}

		-- Round-trip latency threshold to predict server's response
		-- Only applies when multiplexing = "Wezterm"
		-- local_echo_threshold_ms = 10,
		--     }
	},

	-- https://wezfurlong.org/wezterm/multiplexing.html#connecting-into-windows-subsystem-for-linux
	wsl_domains = {
		-- {
		-- The name of this specific domain.  Must be unique amonst all types
		-- of domain in the configuration file.
		-- name = 'WSL:Ubuntu-18.04',

		-- The name of the distribution.  This identifies the WSL distribution.
		-- It must match a valid distribution from your `wsl -l -v` output in
		-- order for the domain to be useful.
		-- distribution = 'Ubuntu-18.04',

		-- The username to use when spawning commands in the distribution.
		-- If omitted, the default user for that distribution will be used.

		-- username = "hunter",

		-- The current working directory to use when spawning commands, if
		-- the SpawnCommand doesn't otherwise specify the directory.

		-- default_cwd = "/tmp"

		-- The default command to run, if the SpawnCommand doesn't otherwise
		-- override it.  Note that you may prefer to use `chsh` to set the
		-- default shell for your user inside WSL to avoid needing to
		-- specify it here

		-- default_prog = {"fish"}
		-- },
		-- win32 configuration
		-- {
		-- name = 'wsl',
		-- serve_command = { 'wsl', 'wezterm-mux-server', '--daemonize' },

		-- }
	},

	-- https://wezfurlong.org/wezterm/multiplexing.html#tls-domains
	tls_clients = {
		-- {
		-- The name of this specific domain.  Must be unique amongst
		-- all types of domain in the configuration file.
		-- name = 'server.name',

		-- If set, use ssh to connect, start the server, and obtain
		-- a certificate.
		-- The value is "user@host:port", just like "wezterm ssh" accepts.
		-- bootstrap_via_ssh = 'server.hostname',

		-- identifies the host:port pair of the remote server.
		-- remote_address = 'server.hostname:8080',

		-- the path to an x509 PEM encoded private key file.
		-- Omit this if you are using `bootstrap_via_ssh`.
		-- pem_private_key = "/some/path/key.pem",

		-- the path to an x509 PEM encoded certificate file
		-- Omit this if you are using `bootstrap_via_ssh`.
		-- pem_cert = "/some/path/cert.pem",

		-- the path to an x509 PEM encoded CA chain file
		-- Omit this if you are using `bootstrap_via_ssh`.
		-- pem_ca = "/some/path/ca.pem",

		-- A set of paths to load additional CA certificates.
		-- Each entry can be either the path to a directory or to a PEM encoded
		-- CA file.  If an entry is a directory, then its contents will be
		-- loaded as CA certs and added to the trust store.
		-- Omit this if you are using `bootstrap_via_ssh`.
		-- pem_root_certs = { "/some/path/ca1.pem", "/some/path/ca2.pem" },

		-- explicitly control whether the client checks that the certificate
		-- presented by the server matches the hostname portion of
		-- `remote_address`.  The default is true.  This option is made
		-- available for troubleshooting purposes and should not be used outside
		-- of a controlled environment as it weakens the security of the TLS
		-- channel.
		-- accept_invalid_hostnames = false,

		-- the hostname string that we expect to match against the common name
		-- field in the certificate presented by the server.  This defaults to
		-- the hostname portion of the `remote_address` configuration and you
		-- should not normally need to override this value.
		-- expected_cn = "other.name",

		-- If true, connect to this domain automatically at startup
		-- connect_automatically = false,

		-- Specify an alternate read timeout
		-- read_timeout = 60,

		-- Specify an alternate write timeout
		-- write_timeout = 60,

		-- The path to the wezterm binary on the remote host
		-- remote_wezterm_path = "/home/myname/bin/wezterm"
		-- }
	},

	tls_servers = {
		-- {
		-- The address:port combination on which the server will listen
		-- for client connections
		-- bind_address = 'server.hostname:8080',

		-- the path to an x509 PEM encoded private key file.
		-- You can omit this if your tls_client is using bootstrap_via_ssh.
		-- pem_private_key = "/path/to/key.pem",

		-- the path to an x509 PEM encoded certificate file.
		-- You can omit this if your tls_client is using bootstrap_via_ssh.
		-- pem_cert = "/path/to/cert.pem",

		-- the path to an x509 PEM encoded CA chain file.
		-- You can omit this if your tls_client is using bootstrap_via_ssh.
		-- pem_ca = "/path/to/chain.pem",

		-- A set of paths to load additional CA certificates.
		-- Each entry can be either the path to a directory
		-- or to a PEM encoded CA file.  If an entry is a directory,
		-- then its contents will be loaded as CA certs and added
		-- to the trust store.
		-- You can omit this if your tls_client is using bootstrap_via_ssh.
		-- pem_root_certs = { "/some/path/ca1.pem", "/some/path/ca2.pem" },
		-- }
	},
}
