#!/bin/bash
echo "Tearing down workspace ..."
if [ -f /tmp/workspace-activated ]; then
    rm /tmp/workspace-activated

    dirs=( CLionProjects
           IdeaProjects
           PhpstormProjects
           PycharmProjects
           RiderProjects
           RubymineProjects
           WebstormProjects
           AndroidStudioProjects
           DialogBlocksProjects
           vpworkspace)

    for d in ${dirs[*]}; do
        test -d /workspace/"$d" && rm -rf /workspace/"$d"
        # if exist link `~/$d' then remove.
        _l=/home/ivan/$d
        test -L "$_l" && rm "$_l"
    done

    # TARGET=/workspace
    # rm -rf ${TARGET}/.* ${TARGET}/*
else
    echo "Doesnt seem to be up: Skipping ..."
fi

rm -rf /workspace/go
#rm /home/ivan/go/1.14.4/src
rm /home/ivan/go/1.16.2/src

rm -rf /workspace/.config  /home/ivan/.config/VisualParadigm
rm -rf /workspace/.npm  /home/ivan/.npm
rm -rf /workspace/.java  /home/ivan/.java
rm -rf /workspace/.cache  /home/ivan/.cache
rm -rf /workspace/.local  /home/ivan/.local
