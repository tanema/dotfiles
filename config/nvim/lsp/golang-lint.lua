return {
	cmd = { 'golangci-lint-langserver' },
	filetypes = { 'go', 'gomod' },
	root_markers = { '.golangci.yml', '.golangci.yaml', 'go.mod', '.git' },
	init_options = {
		command = {
			'golangci-lint',
			'run',
			'--output.text.path=',
			'--output.tab.path=',
			'--output.html.path=',
			'--output.checkstyle.path=',
			'--output.junit-xml.path=',
			'--output.teamcity.path=',
			'--output.sarif.path=',
			'--show-stats=false',
			'--output.json.path=stdout',
		},
	},
}
