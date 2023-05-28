-- mod-version:3 lite-xl 2.1
local formatter = require "plugins.formatter"

formatter.add_formatter {
	name = "Golang Formatter",
	file_patterns = { "%.go$" },
	command = "~/go/bin/goimports -w $FILENAME"
}

