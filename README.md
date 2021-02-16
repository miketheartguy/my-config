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

Windows hosts, from Powershell as Administrator:
```powershell
./scripts/powershell/windows_init.ps1
```

Sync IDE/Editor Settings in VS Code & PyChaem

.gitignore initially copied from https://github.com/github/gitignore
