#!venv/bin/python

import argparse
import json

from config import *

inventory = {
    "all": {
        "hosts": ["localhost"],
        "vars": {
            "ansible_connection": "local",
        },
    },
    "_meta": {
        "hostvars": {
            "localhost": {
                "git_user_name": NAME,
                "git_user_email": EMAIL,
                # geerlingguy.docker
                "docker_users": ["{{ lookup('env','USER') }}"],
                # geerlingguy.pip
                "pip_install_packages": ["docker"],
            },
        }
    },
}


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--list", dest="list", action="store_true")
    parser.add_argument("--host", dest="host")

    args = parser.parse_args()

    if args.list:
        print(json.dumps(inventory, indent=2))
    if args.host:
        print(json.dumps(inventory["all"]["hosts"].get(args.host), indent=2))
