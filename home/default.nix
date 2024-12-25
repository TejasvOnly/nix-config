{username, ...}: {
  imports = [
    ./home.nix
    ./git.nix
    ./fish.nix
    ./starship.nix
  ];

  home.stateVersion = "22.11";

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    sessionVariables.EDITOR = "nvim";
    # FIXME: set your preferred $SHELL
    sessionVariables.SHELL = "/etc/profiles/per-user/${username}/bin/fish";
  };
}
