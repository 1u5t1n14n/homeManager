{ config, pkgs, userName, lib, hasDesktop, ... }:

{

	imports = [
		./Shared/Home.nix
		./backupRemover.nix
	] ++ lib.optionals hasDesktop [
		./Desktop/Home.nix
	] ++ lib.optionals (!hasDesktop) [
		./Server/Home.nix
	];

	home = {
		username = "${userName}";
		homeDirectory = "/home/${config.home.username}";
		stateVersion = "25.05";
		packages = with pkgs; [ ];
	};

	programs.home-manager.enable = true;

}
