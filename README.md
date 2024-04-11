# archlinux-petert
Basic Install and configuration of my preferred environment for ArchLinux, this was heavily inspired and stolen from [TechDufus's version](https://github.com/techdufus/dotfiles).

## Pre-requist

### Make sure you have the vault secret in place
Place the file `~/.ansible-vault/vault.secret` in the vault folder in the home directory, before you run the playbook.
```shell
vim ~/.ansible-vault/vault.secret
```

## Install

### Notes
- Neovim install is the base binary, the configuration of Neovim is pulled from my personal repo: https://github.com/ptsiampas/kickstart.nvim

This playbook uses a custom script in the `bin/dotfiles`. This script is added to your `$PATH` after installation and can be run multiple times.

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ptsiampas/archlinux-petert/main/bin/dotfiles)"
```
If you want to run only a specific role, you can specify the following bash command:
```bash
curl -fsSL  https://raw.githubusercontent.com/ptsiampas/archlinux-petert/main/bin/dotfiles | bash -s -- --tags comma,seperated,tags
```

### Update

This repository is continuously updated with new features and settings which become available to you when updating.

To update your environment run the `dotfiles` command in your shell:

```bash
dotfiles
```

## Encrypted Vault
### How to encrypt a file with Ansible Vault.
For an advanced version using looped values, look at the ssh `main.yml` and `all.yml` within this repo.
```Shell
cat myfile.conf | ansible-vault encrypt_string --vault-password-file $HOME/.ansible-vault/vault.secret --stdin-name "myfile.conf"
```

Copy and paste the output of the above command into `all.yml`.

### How to use within a role.
```yaml
---
- name: "Decrypt and write file"
  copy:
    dest: "{{ ansible_user_dir }}/.config_location/myfile.conf"
    content: "{{ myfile.conf }}"
    mode: "0644"
  no_log: true # don't log the content
```

