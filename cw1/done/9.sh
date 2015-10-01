res=$(echo $1 | rev)
if [ "$res" == "$1" ] ; then
	echo "Yes"
else
	echo "No"
fi
 