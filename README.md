# ansible

# On a completely new machine:

## 1. Install Essential Tools
### Linux:
```bash
sudo apt install curl
```
### MacOS:
```bash
xcode-select --install
```

## 2. Clone the Repository

```bash
mkdir -p ~/personal
cd ~/personal
curl https://raw.githubusercontent.com/VincentVanCode101/ansible/main/resources/setup | bash -s ~/personal/ansible
```

### Vendor agnostic
... and with vendor agnostic I do not mean Windows
#### System
```bash
ansible-playbook playbooks/vendor_agnostic/system/passwordless_sudo.yml --ask-become-pass
```

#### Applications
```bash
ansible-playbook playbooks/vendor_agnostic/applications/docker.yml # Under macos it actually installs orbstack
ansible-playbook playbooks/vendor_agnostic/applications/ctop.yml
```

#### GUIs
```bash
ansible-playbook playbooks/vendor_agnostic/gui/vscode.yml
ansible-playbook playbooks/vendor_agnostic/gui/vnc_viewer.yml
ansible-playbook playbooks/vendor_agnostic/gui/keepassxc.yml
```

#### Chris config (should be vendor agnostic)
```bash
ansible-playbook playbooks/chris_config/setup_ssh_keys.yml --ask-vault-pass

eval $(ssh-agent)
for key in $(find ./resources/.ssh -name "id_*" ! -name "*.pub" -type f -exec basename {} \;); do
    export SSH_KEY="$key"
    ssh-add "$HOME/.ssh/$key"
done
```

### Linux
#### System
```bash
ansible-playbook playbooks/system/i3.yml # Log out and in again to choose the i3 window-manager option
ansible-playbook playbooks/system/ufw.yml
```

#### Applications
```bash
ansible-playbook playbooks/applications/core_apt.yml
ansible-playbook playbooks/applications/core_snap.yml
ansible-playbook playbooks/applications/fzf.yml # On a new system for it to take affect, you have to call ~/.fzf/install
ansible-playbook playbooks/applications/install_zsh.yml # Make sure to log-out and in again for this to take affect
ansible-playbook playbooks/applications/neovim.yml
```
#### GUIs
```bash
ansible-playbook playbooks/gui/brave_browser.yml
ansible-playbook playbooks/gui/spotify.yml
ansible-playbook playbooks/gui/okular.yml
ansible-playbook playbooks/gui/google_chrome.yml
ansible-playbook playbooks/gui/obsidian.yml
```
#### Language Environments
```bash
ansible-playbook playbooks/languages/go_lang.yml
ansible-playbook playbooks/languages/node_js.yml
ansible-playbook playbooks/languages/php_lang.yml
ansible-playbook playbooks/languages/java_lang.yml
ansible-playbook playbooks/languages/r_lang.yml
```

#### Chris config
```bash
ansible-playbook playbooks/chris_config/clone_dotfiles.yml
ansible-playbook playbooks/chris_config/de_chris.yml # Use with 'setxkbmap de-chris' (I guess you have to log-out and in again for this to take affect to activate the keyboard setting)
ansible-playbook playbooks/chris_config/setup_secondbrain.yml
```

### MacOS stuff
```bash
ansible-playbook playbooks/macos/core_brew.yml
ansible-playbook playbooks/macos/aerospace.yml
```

# Ponderings
- should I instal node? npm? nvm? cpp-comiler? clang?

## Mac notes:
defaults write -g ApplePressAndHoldEnabled -bool false

to anble my alt+e connectToContainer.sh on mac in iTerm click: -> iTerm2 -> Settings -> Profiles -> Keys -> General -> "Left option key: Esc+"