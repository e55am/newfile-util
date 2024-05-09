#!/usr/bin/env bash
# uninstall.sh -- uninstall `new` and remove `Templates` dir
#
# Usage:
#	./uninstall.sh

rm_templates() {

	[[ -d "$templates_dir" ]] || { echo "No Templates directory found." >&2; return 1; }

	echo "Remove \"$templates_dir\" Directory? (Y/n)"
	read -p ">> " -r choice
	[[ $choice =~ ^(Y|y) ]] && rm -r "$templates_dir"

}


executable="$(which new)"		# path to new command
[[ $EUID -eq 0 ]] && templates_dir="/usr/local/share/Templates" || templates_dir="$HOME/Templates"

# remove new
if [[ -n "$executable" ]]; then

	# if new in /usr sub dir
	if [[ $executable =~ ^/usr ]]; then
		if [[ $EUID -eq 0 ]]; then
			rm_templates
			rm "$executable"
		else
			echo "Can't uninstall \"$executable\", are you root?" >&2
			return 2
		fi
	else
		rm_templates
		rm "$executable"
	fi
else
	echo "Can't locate 'new'." >&2
	exit 1
fi
