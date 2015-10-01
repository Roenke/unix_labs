temp="/tmp/encode"
touch "$temp"

cat "$1" | while read -n 1 ch
do
	d=$(printf '%d' "'$ch")
	# echo "$ch"
	let "(++d) % 255"
	# echo "$d"
	printf \\$(printf '%03o' $d) >> "$temp"
done
cat "$temp" > "$1"

rm "$temp"