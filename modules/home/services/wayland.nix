{ config, pkgs, ... }:
{
  services.swww.enable = true;
  services.polkit-gnome.enable = true;

  xdg.configFile."niri/config.kdl" = {
    source = ./../../../config.kdl;
  };
}