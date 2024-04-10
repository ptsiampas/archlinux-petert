# archlinux-petert
Basic Install and configuration of my preferred environment for ArchLinux

## Pre-requist
- Need a browser so you can browser, install firefox as the default browser through `pacman`
- Need to setup git with my access token from git, its in my bitwarden vault, follow these instructions
1. **Install the necessary packages**: You need to have `git` and `libsecret` installed on your system. `libsecret` provides the `git-credential-libsecret` helper. If these aren't installed, you can install them using the following command:

    ```sh
    sudo pacman -Syu git libsecret
    ```

2. **Set up Git to use the credential helper**: You need to configure Git to use `libsecret` for credential storage. This is done by running the following command:

    ```sh
    git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
    ```

This setup will prompt you for your username and password the next time you access your GitHub repository. After the initial entry, Git will store your credentials securely and won't ask for them again for future transactions with the repository.

### Make sure you have the vault secret in place
Place the file `~/.ansible-vault/vault.secret` in the vault folder in the home directory, before you run the playbook.

## Install

### Notes
- Neovim install is the base binary, the configuration of Neovim is pulled from my personal repo: https://github.com/ptsiampas/kickstart.nvim

This playbook uses a custom script in the `bin/dotfiles`. This script is added to your `$PATH` after installation and can be run mulitple times.

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
