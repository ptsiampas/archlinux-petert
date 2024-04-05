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

```Shell
Need to put the commands here to add username and token for github.

```

Clone this repository to a ~/dotfiles folder:
```shell
$ git clone https://github.com/ptsiampas/archlinux-petert.git ~/.dotfiles
$ cd ~/.dotfiles/scripts
$ sudo ./install.sh
$ cd ..
$ stow
```

## Post Install
- Install dropbox and filter the directories to just include ssh_keys, once syncronised then copy the keys from `/home/petert/Dropbox/ssh_keys/desktop_keys/*_key` to `~/.ssh/`
- Uncomment the following in the .zshrc file to activate ssh key autoload.
    ```
    plugins=(
    ..
        ssh-agent
    )
    # ssh-agent plugin settings
    zstyle :omz:plugins:ssh-agent agent-forwarding yes
    zstyle :omz:plugins:ssh-agent identities ~/.ssh/*_key
    zstyle :omz:plugins:ssh-agent quiet yes
    ```
- Other post install stuff
