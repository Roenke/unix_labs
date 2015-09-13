function show_usage {
    echo "Usage:"
    echo '    ./copy_exe.sh -i src -o dest'
    echo '  or'
    echo '    ./copy_exe.sh -o dest -i src'
}

if [ "$#" != "4" ] ; then 
    echo "Illegal number of parameters"
    show_usage
elif [ $1 != "-i" ] && [ $1 != "-o" ] ; then
    echo "Wrong first argument: $1"
    show_usage
elif [ $3 != "-i" ] && [ $3 != "-o" ] ; then
    echo "Wrong third argement: $3"
elif [ ! -e $2 ] ; then
    echo "$2 directory not found."
elif [ ! -e $4 ] ; then
    echo "$4 directory not found."
else
    echo "Good"
fi

