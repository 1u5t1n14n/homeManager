{

	description = ''
		A Home-Manager flake for standalone Usage.
	'';

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		homeManager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, homeManager, ... }:
	let

		mkHomeConfig = { userName, hasDesktop, system }:
			homeManager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages."${system}";
				extraSpecialArgs = {
					inherit userName;
					inherit hasDesktop;
				};
				modules = [
					inputs.nixvim.homeManagerModules.nixvim
					./Home.nix
				];
			};
	in {
		homeConfigurations = {
			"1u5t1n14n@Morpheus" = mkHomeConfig {
				userName = "1u5t1n14n";
				hasDesktop = true;
				system = "x86_64-linux";
			};
		};
	};

}
