#/bin/bash
find ./ -not -iname  "*.sh" -type f -mtime -2 -mtime 1 -print0 | xargs -0 -I x echo x | while read -r x; do
	dir=$(dirname "$x")
	base=$(basename "$x")
	mv "$x" "$dir/_$base"
done