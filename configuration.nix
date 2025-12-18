{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" ];
  nix.settings.experimental-features = ["nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";
  fonts.packages = with pkgs; [
    noto-fonts
    source-han-sans
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    jetbrains-mono
    fira-code

  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font"];
      sansSerif = ["Source Han Sans"];
    };
  };
  security.polkit.enable = true;
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  networking.proxy.default = "http://localhost:20171";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  programs.zsh.enable = true;
  services.v2raya.enable = true;
  networking.firewall.allowedTCPPorts = [ 2017 ];
  programs.niri.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
  ];
  console = {
    font = "Lat2-Terminus16";
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # services.libinput.enable = true;

   users.users.rigel = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel" "networkmanager" ];
     packages = with pkgs; [];
   };

  # programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    btop
    curl
    tmux
    htop
    fastfetch
    pciutils
    usbutils
    file
    unzip
    zip
    tree
    ripgrep
  ];

  services.openssh.enable = true;

  system.stateVersion = "25.11";

}

