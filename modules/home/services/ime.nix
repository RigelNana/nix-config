{ config, pkgs, ... }:
{
  home.sessionVariables = {
    QT_IM_MODULES = "wayland;fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };

  home.file.".local/share/fcitx5/rime" = {
    source = ./../../../new-rime;
    recursive = true;
  };

  xdg.configFile."electron-flags.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform=wayland
    --enable-wayland-ime
    --wayland-text-input-version=3
  '';

  xdg.configFile."qq-flags.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform-hint=auto
    --enable-wayland-ime
    --wayland-text-input-version=3
  '';
}