{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.unstable.git;
    delta.enable = true;
    delta.options = {
      line-numbers = true;
      side-by-side = true;
      navigate = true;
    };
    userEmail = "tejasvonly@gmail.com";
    userName = "Tejasv Sharma";
    extraConfig = {
      # url = {
      #   "https://${secrets.git_username}:${secrets.github_token}@github.com" = {
      #     insteadOf = "https://github.com";
      #   };
      #   "https://oauth2:${secrets.gitlab_token}@gitlab.com" = {
      #     insteadOf = "https://gitlab.com";
      #   };
      # };
      push = {
        default = "current";
        autoSetupRemote = true;
      };
      merge = {
        conflictstyle = "diff3";
      };
      diff = {
        colorMoved = "default";
      };
    };
  };
}
