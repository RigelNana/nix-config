{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    windows-fonts
    source-han-sans
    lexend
    source-code-pro
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    maple-mono.NF-CN
    jetbrains-mono
    fira-code
    lxgw-wenkai-screen
    corefonts
    vista-fonts
    vista-fonts-chs
    nur.repos.linyinfeng.plangothic
    hack-font
    iosevka
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Source Han Sans SC" ];
    };
  };
}