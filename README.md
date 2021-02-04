```shell
sudo apt update && sudo apt dist-upgrade
sudo apt install git python3-venv
ssh-keygen -o -a 256 -t ed2551

# Add new SSH key to Github

git clone https://github.com/miketheartguy/my-config.git
cd my-config
source init.sh

ansible-playbook unix_local.yml --ask-become-pass
```

.gitignore initially copied from https://github.com/github/gitignore