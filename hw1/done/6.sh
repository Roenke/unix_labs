#!/bin/bash
function show_usage {
    echo $1
    echo "Usage:"
    echo '    ./copy_exe.sh -i src -o dest'
    echo '  or'
    echo '    ./copy_exe.sh -o dest -i src'
}


if (( $# != 4 ));then
    show_usage "wrong number of arguments"
    exit 1
fi

while getopts "i:o:" opt
do
case $opt in
i) src=$OPTARG;;
o) dest=$OPTARG;;
\? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
:  ) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
*  ) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
esac
done

if [ -z ${src+x} ]; then 
    show_usage "src is unset"
    exit 1
elif [ -z ${dest+x} ]; then 
    show_usage "dest is unset"
    exit 1
fi

if [ ! -d ./"$src" ] ; then
    echo "Input directory not found"
    exit 1
fi

if [ ! -d ./"$dest" ] ; then
    mkdir "$dest"
fi

cd "$src"; find ./* -executable -print0 | xargs -0 -I x cp --parents -- "x" "../$dest"

