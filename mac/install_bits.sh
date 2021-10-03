#! /bin/bash


current="$(cd $(dirname $0) && pwd)"

print_exec() {
    echo $@
    $@
}

for x in $(ls "${current}/bits");do
    scriptf="${current}/bits/$(basename ${x})"
    if [[ -x ${scriptf} ]];then
        print_exec cp -a ${scriptf} ~/local/bin
    fi
done
