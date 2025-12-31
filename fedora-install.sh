#!/bin/bash
set -e  # Stop on error
repos=(
    solopasha/hyprland
    errornointernet/quickshell
)

for repo in "${repos[@]}"; do
    sudo dnf5 -y copr enable $repo
done

sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf install terra-release-extra terra-release-mesa terra-release-multimedia
sudo dnf update

niri_packages=(
"niri"
"xwayland-satellite"
"matugen"
"xdg-desktop-portal"
"wlsunset"
"cava"
"cliphist"
"ddcutil"
"brightnessctl"
"swww"
"qt6ct"
"qt5ct"
"nwg-look"
"quickshell"
"wlogout"
"polkit-kde"
"kf5-kirigami2"
"kf6-kirigami"
"qt6-qtdeclarative"
)

programming_packages=(
  "zed"
  "ghostty"
)


packages=(
  ${niri_packages[@]}
  ${programming_packages[@]}
)

# install rpms
sudo dnf install ${packages[@]}

# install noctalia-shell (I will try to find how to make a copr for this)
mkdir -p ~/.config/quickshell/noctalia-shell && curl -sL https://github.com/noctalia-dev/noctalia-shell/releases/latest/download/noctalia-latest.tar.gz | tar -xz --strip-components=1 -C ~/.config/quickshell/noctalia-shell
