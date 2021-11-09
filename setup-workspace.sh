#!/bin/bash

echo "Setting up workspace ..."

dirs=( CLionProjects
       IdeaProjects
       PhpstormProjects
       PycharmProjects
       RiderProjects
       RubymineProjects
       AndroidStudioProjects
       WebstormProjects
       DialogBlocksProjects
       vpworkspace)

for d in ${dirs[*]}; do
    test -d /workspace/"$d" || mkdir /workspace/"$d"

    # if exist link `~/$d' then remove.
    _l=/home/ivan/$d
    test -L "$_l" && rm "$_l"
    ln -s /workspace/"$d" /home/ivan/"$d"
done

mkdir -p /workspace/obs
mkdir -p /workspace/go/src
#ln -s /workspace/go/src /home/ivan/go/1.14.4/src
ln -s /workspace/go/src /home/ivan/go/1.16.2/src

mkdir -p /workspace/.npm
ln -s /workspace/.npm  /home/ivan/.npm

mkdir -p /workspace/.java
ln -s /workspace/.java  /home/ivan/.java

mkdir -p /workspace/.cache
ln -s /workspace/.cache  /home/ivan/.cache
mkdir /workspace/.cache/nvim

mkdir -p /workspace/.config/VisualParadigm
ln -s /workspace/.config/VisualParadigm  /home/ivan/.config/VisualParadigm

mkdir -p /workspace/.local
ln -s /workspace/.local  /home/ivan/.local
mkdir -p /home/ivan/.local/share /home/ivan/.local/share/nvim/shada

ln -s /home/ivan/.config/jupyter  /home/ivan/.local/share/jupyter

touch /home/ivan/.local/share/nvim/shada/main.shada
nvim -u NORC --headless -c 'qall'

ln -s /home/ivan/.config/cpan  /home/ivan/.local/share/.cpan

mkdir -p /workspace/.email
ln -s /workspace/.email  /home/ivan/.cache/email

##############################################################################
PRJ=fonts

files=(
  fonts
)

for f in ${files[*]}; do
  test -L /home/ivan/.${f} &&
    rm /home/ivan/.${f}
  test -L /home/ivan/.local/share/${f} &&
    rm /home/ivan/.local/share/${f}

  ln -s /home/ivan/developer/${PRJ}/${f} /home/ivan/.${f}
  ln -s /home/ivan/.${f} /home/ivan/.local/share/${f}
done

##############################################################################

TARGET=/workspace
chown ivan:ivan -R $TARGET
echo 0 > /tmp/workspace-activated



