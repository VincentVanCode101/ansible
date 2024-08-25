# ansible

# On a completely new machine:

1.
```bash
sudo apt install curl
```

2.

```bash
mkdir personal
cd personal
curl https://raw.githubusercontent.com/VincentVanCode101/ansible/main/resources/setup | sh
```

3.
```bash
ansible-playbook playbooks/system/passwordless_sudo.yml --ask-become-pass
```
# 4. Have fun

```bash
ansible-playbook playbooks/docker.yml

# System
ansible-playbook playbooks/system/ufw.yml
ansible-playbook playbooks/system/core_apt.yml
ansible-playbook playbooks/system/de-chris.yml # Use with setxkbmap de-chris (I guess you have to log-out and in again for this to take affec)
ansible-playbook playbooks/system/i3.yml # Log-out and in again to choose the i3 window-manager option

# Languages
ansible-playbook playbooks/languages/go_lang.yml

# Terminal Applications
ansible-playbook playbooks/terminal_applications/neovim.yml
ansible-playbook playbooks/terminal_applications/fzf.yml # On a new system for it to take affect, you have to call ~/.fzf/install
ansible-playbook playbooks/terminal_applications/tmux.yml
ansible-playbook playbooks/terminal_applications/install_zsh.yml # Make sure to log-out and in again for this to take affect

# GUIs
ansible-playbook playbooks/gui/brave_browser.yml
ansible-playbook playbooks/gui/spotify.yml
ansible-playbook playbooks/gui/gimp.yml
ansible-playbook playbooks/gui/keepassxc.yml
ansible-playbook playbooks/gui/ocular.yml
```

# Ponderings
- should I instal node? npm? java? cpp-comiler? clang?


```bash
eval $(ssh-agent)
for key in $(find ./resources/.ssh -name "id_*" ! -name "*.pub" -type f -exec basename {} \;); do
    export SSH_KEY="$key"
    ssh-add "$HOME/.ssh/$key"
done
```