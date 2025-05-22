{pkgs, ...}: {
  #Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "GeistMono"];})
  ];
}
