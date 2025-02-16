{ lib, ... }:

{

	home.activation = {
		removeBackups = lib.hm.dag.entryAfter ["writeBoundary"] ''
			echo "Removing backup files..."
			find $HOME -name "*.hm-backup" -type f -delete
			echo "Backup files removed."
		'';
	};

}
