{username, ...}: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "dialout"
      "plugdev"
      # FIXME: uncomment the next line if you want to run docker without sudo
      # "docker"
    ];
    description = "Tejasv Sharma";
    # FIXME: add your own hashed password
    # hashedPassword = "";
    # FIXME: add your own ssh public key
    # openssh.authorizedKeys.keys = [
    #   "ssh-rsa ..."
    # ];
  };
}
