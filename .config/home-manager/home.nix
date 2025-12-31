{ config, pkgs, lib, ... }:

let
  catppuccin-icons = pkgs.catppuccin-papirus-folders.override {
    flavor = "mocha";
    accent = "sapphire";
  };
in
{
  home.username = "oka";
  home.homeDirectory = "/home/oka";

  home.stateVersion = "25.11"; # Please read the comment before changing.


  home.packages = [
    pkgs.nerd-fonts.fantasque-sans-mono
    pkgs.nerd-fonts.hurmit
  ];

  gtk ={
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = catppuccin-icons;
      };
  };

  programs.home-manager.enable = true;
}
