#!/bin/bash
set -e  # Stop on error

# Utilisateur non-root
NON_ROOT_USER=$(logname)
USER_HOME=$(eval echo "~$NON_ROOT_USER")

echo "Installation de Nix"
sudo -u "$NON_ROOT_USER" bash -c 'curl -L https://nixos.org/nix/install | sh'
sudo -u "$NON_ROOT_USER" bash -c "
  echo '. \$HOME/.nix-profile/etc/profile.d/nix.sh' >> \"$USER_HOME/.bashrc\"
  echo '. \$HOME/.nix-profile/etc/profile.d/nix.sh' >> \"$USER_HOME/.zshrc\"
"

echo "Installation de Home Manager"
sudo -u "$NON_ROOT_USER" bash -c "
  . \"$USER_HOME/.nix-profile/etc/profile.d/nix.sh\"
  nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
  nix-channel --update
  nix-shell '<home-manager>' -A install
"

echo "Configuration Home Manager"
sudo -u "$NON_ROOT_USER" bash -c "cp ./home.nix '$USER_HOME/.config/home-manager/home.nix'; \
cp -r ./applications/ '$USER_HOME/.config/home-manager/applications/'; \
mkdir -p '$USER_HOME/.config/nixpkgs'; \
echo '{ allowUnfree = true; }' > '$USER_HOME/.config/nixpkgs/config.nix'; \
source '$USER_HOME/.nix-profile/etc/profile.d/nix.sh'; \
home-manager switch"