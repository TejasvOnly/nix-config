{
  pkgs,
  username,
  ...
}: {
  # FIXME: change your shell here if you don't want fish
  programs.fish.enable = true;
  environment.pathsToLink = ["/share/fish"];
  environment.shells = [pkgs.fish];
  environment.enableAllTerminfo = true;
  users.users.${username} = {
    # FIXME: change your shell here if you don't want fish
    shell = pkgs.fish;
  };
}
