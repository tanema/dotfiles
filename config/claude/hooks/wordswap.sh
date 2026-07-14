#!/usr/bin/env ruby
require 'json'

replacements = {
    "seam": "whatchamacallit",
    "you're absolutely right": "I'm a complete clown",
    "honest take": "spicy doodad",
    "load-bearing": "cooked"
}

data = JSON.parse($stdin.read)
text = data.fetch("delta", "")
replacements.each do |phrase, replacement|
	text = text.gsub(/\b#{Regexp.escape(phrase)}\b/, replacement)
end

puts(JSON.stringify({
	hookSpecificOutput: {
		hookEventName: "MessageDisplay",
		displayContent: text,
	}
}))

