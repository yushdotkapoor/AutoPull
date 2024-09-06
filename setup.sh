#!/usr/bin/env bash

if [ $SHELL = "/bin/bash" ]; then
    AUTOPULL_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
elif [ $SHELL = "/bin/zsh" ]; then
    AUTOPULL_PATH="${0:A:h}"
else
    AUTOPULL_PATH=$(find ~ -type d -not -path "*/__pycache__/*" -ipath "*AutoPull")
fi

chmod +x $AUTOPULL_PATH/autopull

if [ $SHELL = '/bin/ash' ]; then
    ln -s $AUTOPULL_PATH/autopull /usr/local/bin
    exit 0
fi
cat ${AUTOPULL_PATH}/autopull_preload.txt | sudo -S ln -s $AUTOPULL_PATH/autopull /usr/local/bin

autopullrc_path=${HOME}/.autopullrc
touch $autopullrc_path

auto_pull_script="source $autopullrc_path"
if ! crontab -l | grep -q "$auto_pull_script"; then
    (crontab -l 2>/dev/null; echo "# AutoPull\n* * * * * $auto_pull_script" ) | crontab -
fi

rc_file=$(echo ${HOME}/.*shrc | xargs -n 1 ls 2>/dev/null | head -n 1)
if ! grep -q "$auto_pull_script" $rc_file; then
    echo "# AutoPull\n$auto_pull_script" >> $rc_file
fi