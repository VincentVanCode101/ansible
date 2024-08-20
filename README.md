# ansible

# On a completely new machine:

1.
```bash
sudo apt install curl git
```

2.

```bash
mkdir personal
cd personal
curl https://raw.githubusercontent.com/VincentVanCode101/ansible/main/resources/setup | sh
```

3.
```bash
ansible-playbook passwordless_sudo.yml --ask-become-pass
```
