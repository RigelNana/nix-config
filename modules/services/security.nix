{ config, pkgs, ... }:
{
  security.polkit.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  services.gnome.gnome-keyring.enable = true;
  
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  services.udisks2.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-keyring
    libsecret
    seahorse
  ];
}