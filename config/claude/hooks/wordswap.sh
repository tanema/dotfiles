#!/usr/bin/env ruby
require 'json'

replacements = {
    "seam": "thing",
    "you're absolutely right": "I'm a complete clown",
    "honest take": "garbage output",
    "load-bearing": "bricked up",
    "Cooked": "🔥🌎🔥"
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

