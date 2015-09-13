#!/bin/bash
function show_usage {
    echo $1
    echo "Usage:"
    echo '    ./copy_exe.sh -i src -o dest'
    echo '  or'
    echo '    ./copy_exe.sh -o dest -i src'
}

if [ "$#" != "4" ] ; then 
    show_usage "Illegal number of parameters"
elif [ $1 != "-i" ] && [ $1 != "-o" ] ; then
    show_usage "Wrong first argument: $1"
elif [ $3 != "-i" ] && [ $3 != "-o" ] ; then
    show_usage "Wrong third argement: $3"
elif [ ! -e $2 ] ; then
    show_usage "$2 directory not found."
elif [ $1 == $3 ] ; then
    show_usage "Duplicate $1 directories."
else
    if [ $1 == "-i" ] ; then
        src=$2
        dest=$4
    else
        src=$4
        dest=$2
    fi
    mkdir -p $dest
    find "$src/" -type f -executable -exec cp -r {} $dest/ \;
fi
