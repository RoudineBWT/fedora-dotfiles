### My Fedora Rawhide Setup
In this dotfiles you will find my niri configuration, noctalia-shell,  fastfetch and more.

What i did to setup fedora rawhide + nix :

firstly I enabled terra repo
```
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf in terra-release-extra terra-release-mesa terra-release-multimedia
sudo dnf update
```
secondly I installed nix and home manager via this *nix-installer.sh*
```
git clone https://github.com/RoudineBWT/fedora-dotfiles.git
cd fedora-dotfiles
sudo bash nix-install.sh
```


![Screenshot of my fedora rawhide setup](wall.png)
