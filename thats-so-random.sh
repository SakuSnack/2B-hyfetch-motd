#shellcheck disable=SC2004,SC2086,SC2231,SC2034

# thats-so-random.sh
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

dataLocation=""
if [ -z $XDG_DATA_HOME ]; then
	dataLocation="$HOME/.local/share/thats-so-random"
else
	dataLocation="$XDG_DATA_HOME/thats-so-random"
fi
logoLocation="$dataLocation/logos"

if [ ! -z $1 ] && [ $1 = "help" ]; then
	{
		myname=$(echo "$0" | rev | cut -d'/' -f1 | rev)
		echo "$myname options:"
		echo "help: display this help text"
		echo "update: Fetch the latest version from github"
		echo "skip-colour: skip colourizing the logo (uses your fastfetch colour instead)"
		exit 0
	}
fi

if [ ! -z $1 ] && [ $1 = "update" ]; then
	{
		mkdir -p $dataLocation
		cd $dataLocation || exit 1
		git clone https://github.com/SakuSnack/2B-hyfetch-motd >/dev/null 2>&1 || exit 1
		(
			cd 2B-hyfetch-motd || exit 1
			chmod +x install.sh
			THATS_SO_RANDOM_UPDATE=1 ./install.sh
			unset THATS_SO_RANDOM_UPDATE
		)
		rm -rf 2B-hyfetch-motd
		exit 0
	}
fi

easteregg() {
	# This function is an easter egg. Please don't tell anyone <3

	# Set up the base logo

	logo_easteregg="⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣯⢻⣿⣿⣿⣿⣆⠀⠀⠀
⠀⠀⠀⢀⣿⣿⣿⣿⣏⡏⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣧⢻⣿⣿⣿⣿⡆⠀⠀
⠀⠀⠀⣼⣿⣿⣿⣿⣿⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣇⢻⣿⣿⣿⣿⠀⠀
⠀⠀⢠⣿⣿⠿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⠀⢿⣿⣿⣿⡄⠀
⠀⠀⢸⣿⣿⣧⡙⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠈⠛⢿⣿⣿⡇⠸⣿⡿⣸⡇⠀
⠀⠀⠸⣿⣿⣿⣿⣦⡙⠳⠀⠀⠀⠀⠀⠀⢀⣠⣤⣀⣈⠙⠃⠀⠿⢇⣿⡇⠀
⠀⠀⠀⢿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣷⣆⡀⣼⣿⡇⠀
⠀⠀⠀⠘⣿⣿⣿⢿⣷⡀⠀⢀⣴⣾⣟⠉⠉⠉⠉⣽⣿⣿⣿⣿⠇⢹⣿⠃⠀
⠀⠀⠀⠀⠘⢿⣿⣎⢻⣷⠰⣿⣿⣿⣿⣦⣀⣀⣴⣿⣿⣿⠟⢫⡾⢸⡟⠀⠀
⠀⠀⠀⠀⠀⠀⠙⠿⣧⠙⢷⠙⠻⠿⢿⡿⠿⠿⠛⠋⠉⠀⠀⠘⠁⠞⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣴⡖⠀⠿⣋⣉⣉⡁⠀⢾⣦⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀YoRHa No.2 Type B⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀chooses you to fight!⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀use fly!⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"

	# If the user has replaced the name string (line 17) in their 2B logos, import it here to keep it for the easter egg
	name_replace_string=$(sed -n '17p' $logoLocation/2B-*.txt)
	name_original_string=$(echo "$logo_easteregg" | sed -n '17p')
	logo_easteregg=$(printf '%s' "$logo_easteregg" | sed -e "s/$name_original_string/$name_replace_string/g")

	# Set (temporary) filename to use in hyfetch/fastfetch later
	file_easteregg=".2B-choose.easteregg"
	# Read string to replace from template up above for use later
	string_to_replace=$(echo "$logo_easteregg" | sed -n '21p')
	# Set total logo width (this is done manually because wc -c miscounts special characters such as braille glyphs)
	logo_width=29
	# Do not use more than 1 glyph for this
	bufferspace="⠀"

	# We are not compatible with pure POSIX shell, so arrays are fine
	# Set up an array containing all moves 3 or 4 letters long
	# This ends up being 29 moves, the same number as columns in the logo, which is very satisfying
	moves=("Cut" "Fly" "Dig" "Hex" "Gust" "Bind" "Slam" "Wrap" "Leer" "Bite" "Roar" "Sing" "Acid" "Mist" "Surf" "Peck" "Rage" "Haze" "Bide" "Lick" "Smog" "Rest" "Hail" "Wish" "Yawn" "Dive" "Howl" "Soak" "Coil")

	# Select one of the moves at random
	chosen_move="${moves[$(($RANDOM % ${#moves[@]}))]}"

	# Make a command string with our chosen move
	commandString=", use $chosen_move!"

	# Calculate the maximum length the username can be based on the column width of the logo
	# and the command string we just defined, then trim the user name to that length using cut
	# Max user name length ends up being 18 or 19 letters, depending on if the move had 3 or 4 letters
	# 18 is more likely. The usual max limit for user names is 32 but that is longer than even the total logo width
	# so we have to make do with what we get
	max_user_length=$(($logo_width - ${#commandString}))
	username=$(printf '%s' "$USER" | cut -c1-$max_user_length)

	# Calculate the amount of filler glyphs we need to fill out the logo width based on
	# logo width minus lengths of the user name and command string
	missing_length=$(($logo_width - ${#username} - ${#commandString}))

	# Divide missing length by 2 to obtain half that length (rounded by the system, doesn't matter which way for the total length)
	# should end up being shorter for the first half
	# Calculate the second half based on the difference between total missing and first half to avoid rounding errors
	firsthalf=$(($missing_length / 2))
	secondhalf=$(($missing_length - $firsthalf))

	# Set up empty string to hold our final constructed string
	construct_string=""

	# Fill the first half of buffer glyphs into the constructed string
	for i in $(seq $firsthalf); do
		construct_string="$construct_string$bufferspace"
	done

	# Add the user name and the command string to the constructed string
	construct_string="$construct_string$username$commandString"

	# Fill the second half of buffer glyphs into the constructed string
	for i in $(seq $secondhalf); do
		construct_string="$construct_string$bufferspace"
	done

	# We now have a completed string to put into our logo, so edit the logo and then save it to disk
	logo_easteregg=$(printf '%s' "$logo_easteregg" | sed -e "s/$string_to_replace/$construct_string/g")
	printf '%s' "$logo_easteregg" >$logoLocation/$file_easteregg

	# Call hyfetch or fastfetch with the easter egg logo only
	if [ ! -z $1 ] && [ $1 = "skip-colour" ]; then
		eval "fastfetch --logo $logoLocation/$file_easteregg"
	else
		eval "hyfetch --ascii-file $logoLocation/$file_easteregg"
	fi
	rm -f $logoLocation/$file_easteregg
	exit 0
}

# Get the current date, split into month and day
current_date=$(date -Idate)
current_month=$(printf '%s' "$current_date" | cut -d'-' -f2)
current_day=$(printf '%s' "$current_date" | cut -d'-' -f3)

# Force april fools for testing
#current_month="04"
#current_day="01"

# If it is the 1st of april, do the april fools easter egg :kekitty:
if [ $current_month -eq "04" ] && [ $current_day -eq "01" ]; then
	easteregg "$@"
fi

randomFetch=()

if [ ! -z $1 ] && [ $1 = "skip-colour" ]; then
	for logo in $logoLocation/*; do {
		randomFetch+=("fastfetch --logo $logo")
	}; done
else
	for logo in $logoLocation/*; do {
		randomFetch+=("hyfetch --ascii-file $logo")
	}; done
fi

eval "${randomFetch[$(($RANDOM % ${#randomFetch[@]}))]}"
