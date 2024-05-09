#!/usr/bin/env bash
# install.sh -- install `new`
#
# Usage:
#	./install.sh

EXIT_STAT=0
repo_dir="${0%/*}"		# `new` repo dir

# system wide install
if [[ $EUID -eq 0 ]]; then
	templates_dir="/usr/local/share/Templates"
	executable_dir="/usr/local/bin"

	[[ -d "$templates_dir" ]] || mkdir "$templates_dir"

	cp "$repo_dir/new" /usr/local/bin || EXIT_STAT=1

	# replace path to templates dir, in new
	sed -ie 's/TEMPLATE_DIR="$HOME\/Templates\/"/TEMPLATE_DIR="\/usr\/local\/share\/Templates"/' /usr/local/bin/new
	cp -r $repo_dir/Templates/* "$templates_dir/" || EXIT_STAT=1

# install for current user
else
	templates_dir="$HOME/Templates"
	executable_dir="$HOME/bin"

	[[ -d "$templates_dir" ]] || mkdir "$templates_dir"
	[[ -d "$executable_dir" ]] || mkdir "$executable_dir"

	case :$PATH: in
		*:$executable_dir:*)
			;;
		*)
			# Prepending path
			export PATH="$executable_dir:$PATH"
			echo "export PATH=\"$executable_dir:$PATH\"" >> "$HOME/.bashrc"
			;;
	esac

	cp "$repo_dir/new" "$executable_dir" || EXIT_STAT=1
	cp -r $repo_dir/Templates/* "$templates_dir" || EXIT_STAT=1

	[[ $EXIT_STAT -eq 0 ]] && echo "Please open new tab or 'source $HOME/.bashrc'."
fi


if [[ $EXIT_STAT -eq 0 ]]; then
	echo "new: Installation finished successfully!"
else
	echo "new: Installation unsuccessful, Something wrong." >&2
fi
exit $EXIT_STAT
