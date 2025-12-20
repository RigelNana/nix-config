{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  programs.xwayland.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" "https://cache.nixos.org/" ];
  nix.settings.experimental-features = ["nix-command" "flakes" ];
  services.flatpak.enable = true;
  services.xserver = { 
    enable = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver
      libva-utils
      mesa
      ffmpeg
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
    NIXOS_OZONE_WL = "1";
  };

  services.fprintd.enable = true;
  networking.networkmanager.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
	user = "greeter";
      };
    };
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
  time.timeZone = "Asia/Shanghai";
  fonts.packages = with pkgs; [
    noto-fonts
    source-han-sans
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
  
  programs.nix-ld.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      fcitx5-rime
      rime-data
      kdePackages.fcitx5-configtool
      kdePackages.fcitx5-qt
      qt6Packages.fcitx5-chinese-addons
      libsForQt5.fcitx5-qt
    ];

  };

  programs.zsh.enable = true;
  services.v2raya.enable = true;
  programs.niri.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "zh_CN.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
  ];
  i18n.extraLocaleSettings = {
    LC_MESSAGES = "zh_CN.UTF-8";
  };
  console = {
    font = "Lat2-Terminus16";
  };
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

   services.libinput.enable = true;

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

