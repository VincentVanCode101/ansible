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
cd ansible
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
ansible-playbook playbooks/vendor_agnostic/applications/ollama.yml
ansible-playbook playbooks/vendor_agnostic/applications/fzf.yml # On new linux call ~/.fzf/install (mac seemed to work right away)
```

#### GUIs
```bash
ansible-playbook playbooks/vendor_agnostic/gui/vscode.yml
ansible-playbook playbooks/vendor_agnostic/gui/keepassxc.yml
```

#### Chris config 
```bash
ansible-playbook playbooks/vendor_agnostic/chris_config/setup_ssh_keys.yml --ask-vault-pass
ansible-playbook playbooks/vendor_agnostic/chris_config/setup_ssh_config.yml

eval $(ssh-agent)
for key in $(find ./resources/.ssh -name "id_*" ! -name "*.pub" -type f -exec basename {} \;); do
    export SSH_KEY="$key"
    ssh-add "$HOME/.ssh/$key"
done

ansible-playbook playbooks/vendor_agnostic/chris_config/clone_dotfiles.yml #for this you need zsh installed, so if on linux, run `Applications` parts first
ansible-playbook playbooks/vendor_agnostic/chris_config/clone_important_repos.yml
ansible-playbook playbooks/vendor_agnostic/chris_config/setup_secondbrain.yml
```

### Linux
#### System
```bash
ansible-playbook playbooks/system/i3.yml # Log out and in again to choose the i3 window-manager option
ansible-playbook playbooks/system/ufw.yml
ansible-playbook playbooks/system/tailscale.yml # run "sudo tailscale up" to start
```

#### Applications
```bash
ansible-playbook playbooks/applications/core_apt.yml
ansible-playbook playbooks/applications/core_snap.yml
ansible-playbook playbooks/applications/install_zsh.yml # Make sure to log-out and in again for this to take affect
ansible-playbook playbooks/applications/neovim.yml
ansible-playbook playbooks/applications/aider.yml
```
#### GUIs
```bash
ansible-playbook playbooks/gui/brave_browser.yml
ansible-playbook playbooks/gui/spotify.yml
ansible-playbook playbooks/gui/okular.yml
ansible-playbook playbooks/gui/google_chrome.yml
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
ansible-playbook playbooks/chris_config/de_chris.yml # Use with 'setxkbmap de-chris' (I guess you have to log-out and in again for this to take affect to activate the keyboard setting)
```

### MacOS stuff
```bash
ansible-playbook playbooks/macos/core_brew.yml
ansible-playbook playbooks/macos/aerospace.yml
ansible-playbook playbooks/macos/p10k.yml
ansible-playbook playbooks/macos/teams.yml
ansible-playbook playbooks/macos/whatsapp.yml
ansible-playbook playbooks/macos/firefox.yml

ansible-playbook playbooks/macos/system/karabiner_elements.yml
```

# Ponderings
- should I instal node? npm? nvm? cpp-comiler? clang?
- add vim installation
  - make it the default terminal editor (sudo update-alternatives --config editor)
- add installation of brightnessctl

## Mac notes:
defaults write -g ApplePressAndHoldEnabled -bool false

to anble my alt+e connectToContainer.sh on mac in iTerm click: -> iTerm2 -> Settings -> Profiles -> Keys -> General -> "Left option key: Esc+"

## General Notes
- For online ansible vault encryption/decryption, go to https://ansible-vault.braz.dev/

## Todos
- [ ] install uv: curl -LsSf https://astral.sh/uv/install.sh | sh
- [ ] install claude: curl -fsSL https://claude.ai/install.sh | bash
  - echo '{"hasCompletedOnboarding": true}' > ~/.claude.json (if want to use with local llm)
- [ ] install code-review-graph:
  - uv tool install code-review-graph
  - uv pip install "code-review-graph[communities]"
- [ ] install commitizen: uv tool install commitizen && uv tool upgrade commitizen
- [ ] install caveman:
claude plugin marketplace add JuliusBrussee/caveman && claude plugin install caveman@caveman