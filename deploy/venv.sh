#!/bin/bash

current=$PWD

curr_file_path="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
curr_root_path="$(dirname "${curr_file_path}")"
venv_path="${curr_root_path}/.venv"
cd ${curr_root_path}


REQUIRED_PKG="virtualenv"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
    echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
    sudo apt-get --yes install $REQUIRED_PKG
fi


if [[ ! -f ${venv_path} ]]; then
    echo "Creating virtualenv folder"
    virtualenv -p /usr/bin/python3.8 ${venv_path}
fi

echo "Activating virtualenv and installing requirements"
source ${venv_path}/bin/activate && pip install -r ${curr_root_path}/deploy/requirements.txt

while true; do
    read -p "Do you wish to have a web framework using Fast API? [y/n]" yn
    case $yn in
        [Yy]* ) pip install fastapi[all]; break;;
        [Nn]* ) echo "Ok";break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo """
Start working on the virtualenv folder with:

cd ${curr_root_path}
source ${venv_path}/bin/activate

When finished, type "deactivate" or remove the .venv folder
"""

cd $current
