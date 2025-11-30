#!/usr/bin/env bash
#shellcheck disable=SC2086

# install.sh
# Copyright (C) 2025 SakuSnack
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

INSTALL_BIN="$HOME/.local/bin"

if [ -z $XDG_DATA_HOME ]; then
	INSTALL_DATA="$HOME/.local/share"
else
	INSTALL_DATA="$XDG_DATA_HOME"
fi

# Set up formatting escape sequences
bold=$(tput bold)
normal=$(tput sgr0)

echo "Installing script to $INSTALL_BIN"
mkdir -p $INSTALL_BIN
cp thats-so-random.sh $INSTALL_BIN/ || exit 1
chmod +x $INSTALL_BIN/thats-so-random.sh || exit 1

echo "Installing logos to $INSTALL_DATA/thats-so-random/logos"
mkdir -p $INSTALL_DATA/thats-so-random/logos || exit 1
cp thats-so-random-logos/* $INSTALL_DATA/thats-so-random/logos/ || exit 1

if [ -z $THATS_SO_RANDOM_UPDATE ]; then
	{
		echo ""
		echo "Installation successful. Please add ${bold}thats-so-random.sh${normal} to your shell init file."
		echo "Bash: ~/.bashrc    zsh: ~/.zshrc    fish: ~/.config/fish/config.fish"
		echo ""
		echo "For zsh, add it after ${bold}export PATH=\$HOME/.local/bin:\$PATH${normal}"
		echo "If you use a powerlevel9k or powerlevel10k instant prompt, add ${bold}thats-so-random${normal} before sourcing the instant prompt."
		echo ""
		echo "If you have not configured hyfetch yet, please run ${bold}hyfetch --config${normal} now."
	}
else
	{
		echo "Update complete."
	}
fi
