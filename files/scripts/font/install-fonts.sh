#!/bin/bash

installed_files=0

for FILE in "${@}"; do

	# Check if the file is a font file
	if [[ ! $(file --mime-type -b "$FILE") == font/* ]]; then
		continue
	fi

	sudo cp "${FILE}"  ~/.local/share/fonts/
	installed_files=$((installed_files + 1))
done

if [ ${installed_files} -eq 0 ]; then
	zenity --error --text="No fonts selected. Please select one or more font files to install."
	exit 1
else
	notify-send "Fonts Installed" "Successfully installed ${installed_files} fonts"
fi