{ config, pkgs, ... }:
{
  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  qt = {
    enable = true;
  };
}