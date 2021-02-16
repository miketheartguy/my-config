#!/bin/bash

export ANSIBLE_ROLES_PATH=${PWD}/galaxy_roles
export ANSIBLE_INVENTORY=${PWD}/inventory.py

function usage
{
    local txt=(
      "Script for initializing/installing a local dev environment"
      "Usage: $0 [options]"
      ""
      "Options:"
      "  --help, -h     Print help."
      "  --install, i   Install/Reinstall dependencies."
    )
    printf "%s\n" "${txt[@]}"
}
while [ ! -z "$1" ];do
    case "$1" in
          -h|--help)
            usage
            ;;
          -i|--install)
            INSTALL=true
            echo "Argument Passed: $1"
            shift
            ;;
          *)
            echo "Unknown Argument: $1"
    esac
  shift
done

if [ ! -d "${PWD}/venv" ]; then
    echo "Creating vitual environment at ${PWD}/venv"
    python3 -m venv ./venv
    INSTALL=true
fi
echo "Activating virtual environment"
source venv/bin/activate

if [ "$INSTALL" = true ] ; then
    echo "Installing Python Dependencies"
    pip install -U -e .
    echo "Installing Ansible Galaxy Dependencies"
    ansible-galaxy install --force -r requirements.yml
    git clone https://github.com/morgangraphics/ansible-role-nvm $ANSIBLE_ROLES_PATH/ansible-role-nvm
    pre-commit install
fi
