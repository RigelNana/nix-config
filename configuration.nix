{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system/boot.nix
    ./modules/system/hardware.nix
    ./modules/system/networking.nix
    ./modules/system/locale.nix
    ./modules/system/fonts.nix
    ./modules/system/users.nix
    ./modules/system/nix.nix
    
    ./modules/services/display.nix
    ./modules/services/audio.nix
    ./modules/services/bluetooth.nix
    ./modules/services/input-method.nix
    ./modules/services/virtualization.nix
    ./modules/services/security.nix
    
    ./modules/programs/gaming.nix
    ./modules/programs/development.nix
  ];




  
  


  



  
  
  
  


  
  






  

  system.stateVersion = "25.11";

}
