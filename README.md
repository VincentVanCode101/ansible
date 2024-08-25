# ansible

# On a completely new machine:

## 1. Install Essential Tools
```bash
sudo apt install curl
```

## 2. Clone the Repository

```bash
mkdir personal
cd personal
curl https://raw.githubusercontent.com/VincentVanCode101/ansible/main/resources/setup | sh
```

## 3. Get the system to execute sudo without password input (in order for the other playbooks to work properly)
```bash
ansible-playbook playbooks/system/passwordless_sudo.yml --ask-become-pass
```

### 4. System Configuration
```bash
ansible-playbook playbooks/system/i3.yml # Log out and in again to choose the i3 window-manager option
ansible-playbook playbooks/system/ufw.yml
```

### 4. Application Setup

```bash
ansible-playbook playbooks/applications/core_apt.yml
ansible-playbook playbooks/applications/core_snap.yml
ansible-playbook playbooks/applications/ctop.yml
ansible-playbook playbooks/applications/docker.yml
ansible-playbook playbooks/applications/fzf.yml # On a new system for it to take affect, you have to call ~/.fzf/install
ansible-playbook playbooks/applications/install_zsh.yml # Make sure to log-out and in again for this to take affect
ansible-playbook playbooks/applications/neovim.yml
ansible-playbook playbooks/applications/obsidian.yml

```
### 5. GUI Applications (Yeah, some GUIs are installed in core_apt & core_snap)
```bash
ansible-playbook playbooks/gui/brave_browser.yml
ansible-playbook playbooks/gui/spotify.yml
ansible-playbook playbooks/gui/keepassxc.yml
ansible-playbook playbooks/gui/okular.yml
ansible-playbook playbooks/gui/vscode.yml
ansible-playbook playbooks/gui/google_chrome.yml
```

### 6. Language Environments
```bash
ansible-playbook playbooks/languages/go_lang.yml
ansible-playbook playbooks/languages/node_js.yml
```

### 7. Chris' Configuration
```bash
ansible-playbook playbooks/chris_config/setup_ssh_keys.yml

eval $(ssh-agent)
for key in $(find ./resources/.ssh -name "id_*" ! -name "*.pub" -type f -exec basename {} \;); do
    export SSH_KEY="$key"
    ssh-add "$HOME/.ssh/$key"
done

ansible-playbook playbooks/chris_config/clone_dotfiles.yml
ansible-playbook playbooks/system/de-chris.yml # Use with 'setxkbmap de-chris' (I guess you have to log-out and in again for this to take affect to activate the keyboard setting)
```

# Ponderings
- should I instal node? npm? java? cpp-comiler? clang?
