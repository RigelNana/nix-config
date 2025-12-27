{ config, pkgs, ... }:
{
  boot.supportedFilesystems = [ "ntfs" ];
  
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
    fsIdentifier = "label";
    gfxmodeEfi = "2880x1800";
    font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMono-Bold.ttf";
    fontSize = 36;
    gfxpayloadEfi = "text";
  };
  
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}