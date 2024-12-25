{
  username,
  pkgs,
  ...
}: {
  # Directly start hyprland
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
        user = username;
      };
      default_session = initial_session;
    };
  };
}
