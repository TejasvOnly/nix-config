{pkgs, ...}: {
  #Fonts
  fonts.fonts = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono" "GeistMono"];})
  ];
}
