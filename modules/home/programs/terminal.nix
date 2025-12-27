{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "Catppuccin-Macchiato";
    font = {
      name = "Maple Mono NF CN";
      size = 14;
    };
    settings = {
      background_opacity = 0.9;
      hide_window_decorations = true;
      window_padding_width = 5;
      enable_audio_bell = false;
    };
  };
}