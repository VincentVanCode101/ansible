#!/usr/bin/env bash

script_dir="$(dirname "$0")"

eval "$(ssh-agent -s)" > /tmp/agent_env

echo "export SSH_AUTH_SOCK=${SSH_AUTH_SOCK}" >> /tmp/agent_env
echo "export SSH_AGENT_PID=${SSH_AGENT_PID}" >> /tmp/agent_env

ssh_key_dir="$script_dir/../../resources/.ssh"
ssh_keys=$(find "$ssh_key_dir" -type f -name 'id_*' ! -name '*.pub' -exec basename {} \;)

for key in $ssh_keys; do
    ssh_add_path="$HOME/.ssh/$key"
    if [[ -f $ssh_add_path ]]; then
        ssh-add "$ssh_add_path"
        echo "Added SSH key: $ssh_add_path"
    else
        echo "SSH key not found: $ssh_add_path"
    fi
done
