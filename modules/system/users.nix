{ config, pkgs, ... }:
{
  users.users.rigel = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    packages = with pkgs; [ ];
  };

  programs.zsh.enable = true;
}