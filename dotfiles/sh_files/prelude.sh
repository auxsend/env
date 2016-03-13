# library functions for *sh
die () {
    echo $@
    exit 1
}

string_to_file () {
    local str=$1
    local path=$2

    if [ -f "$path" ] ; then 
        echo "Err file $path alread exists"
        exit 1
    else
        echo $str > "$path" 
    fi
}
