{ config, pkgs, ... }:
{
  xdg.desktopEntries."wpsoffice-cn" = {
    name = "WPS";
    exec = "env QT_FONT_DPI=192 wps %F";
  };

  xresources.properties = {
    "Xft.dpi" = 192;
  };
}