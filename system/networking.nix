{hostname, ...}: {
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "${hostname}";

  # for wireguard
  networking.firewall.checkReversePath = false;

  # dns
  networking.nameservers = ["8.8.8.8" "1.1.1.1"];

  # don't try to resolve dns by networkmanager
  networking.networkmanager.dns = "none";

  # disable the EDNS mechanism which often breaks on older routers
  networking.resolvconf.dnsExtensionMechanism = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
