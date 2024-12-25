{
  # FIXME: uncomment the next line if you want to reference your GitHub/GitLab access tokens and other secrets
  # secrets,
  username,
  hostname,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./system/time.nix
    ./system/ld.nix
    ./system/shell.nix
    ./system/udev.nix
    ./system/nix.nix
    ./system/user.nix
  ];

  # TODO: consolidate into a nix module
  networking.hostName = "${hostname}";

  security.sudo.wheelNeedsPassword = false;

  # FIXME: uncomment the next line to enable SSH
  # services.openssh.enable = true;

  home-manager.users.${username} = {
    imports = [
      ./home
    ];
  };

  system.stateVersion = "24.05";

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = username;
    startMenuLaunchers = true;

    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;

    usbip = {
      enable = true;
      autoAttach = ["2-3"];
    };
  };

  environment.systemPackages = [
    pkgs.libfido2
    pkgs.yubikey-manager
  ];

  services.pcscd.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  # FIXME: uncomment the next block to make vscode running in Windows "just work" with NixOS on WSL
  # solution adapted from: https://github.com/K900/vscode-remote-workaround
  # more information: https://github.com/nix-community/NixOS-WSL/issues/238 and https://github.com/nix-community/NixOS-WSL/issues/294
  # systemd.user = {
  #   paths.vscode-remote-workaround = {
  #     wantedBy = ["default.target"];
  #     pathConfig.PathChanged = "%h/.vscode-server/bin";
  #   };
  #   services.vscode-remote-workaround.script = ''
  #     for i in ~/.vscode-server/bin/*; do
  #       if [ -e $i/node ]; then
  #         echo "Fixing vscode-server in $i..."
  #         ln -sf ${pkgs.nodejs_18}/bin/node $i/node
  #       fi
  #     done
  #   '';
  # };
}
