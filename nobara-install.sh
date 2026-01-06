#!/bin/bash
set -e  # Stop on error
repos=(
    solopasha/hyprland
    yalter/niri
    errornointernet/quickshell
    zhangyi6324/noctalia-shell
)

for repo in "${repos[@]}"; do
    sudo dnf5 -y copr enable $repo
done

niri_packages=(
"niri"
"fish"
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
sudo dnf install -y ${packages[@]}

noctalia-shell
