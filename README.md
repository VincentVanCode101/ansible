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
ansible-playbook playbooks/passwordless_sudo.yml --ask-become-pass
```
# 4. Have fun

```bash
ansible-playbook playbooks/docker.yml
ansible-playbook playbooks/ufw.yml
```