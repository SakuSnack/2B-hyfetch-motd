#shellcheck disable=SC2004,SC2086,SC2231,SC2034

# thats-so-random.sh
# Copyright (C) 2025-2026 SakuSnack
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

# Environment variable to skip printing the message
[ ! -z $HIDE_MOTD ] && exit 0

# Set up formatting escape sequences
bold=$(tput bold)
normal=$(tput sgr0)

dataLocation=""
if [ -z $XDG_DATA_HOME ]; then
	dataLocation="$HOME/.local/share/thats-so-random"
else
	dataLocation="$XDG_DATA_HOME/thats-so-random"
fi
logoLocation="$dataLocation/logos"

if [ ! -z $1 ] && [ $1 = "help" ]; then
	{
		myname=$(printf '%s' "$0" | rev | cut -d'/' -f1 | rev)
		printf "%s%s%s options:\n\n" "${bold}" "$myname" "${normal}"
		printf "%shelp%s: display this help text\n" "${bold}" "${normal}"
		printf "%supdate%s: Fetch the latest version from github\n" "${bold}" "${normal}"
		printf "%sskip-colour%s: skip colourizing the logo (uses your fastfetch colour instead)\n" "${bold}" "${normal}"
		exit 0
	}
fi

if [ ! -z $1 ] && [ $1 = "update" ]; then
	{
		mkdir -p $dataLocation
		if [ ! -w "$dataLocation" ]; then
			printf "%s%s%s is not a writable location, aborting\n" "${bold}" "$dataLocation" "${normal}"
			exit 1
		fi
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
	name_original_string=$(printf '%s' "$logo_easteregg" | sed -n '17p')
	logo_easteregg=$(printf '%s' "$logo_easteregg" | sed -e "s/$name_original_string/$name_replace_string/g")

	# Set (temporary) filename to use in hyfetch/fastfetch later
	# Generate a random suffix for our temporary file to avoid mktemp as the syntax is potentially different on macos
	randomSuffix=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 6)
	file_easteregg="/tmp/thats-so-random-2B-choose.$randomSuffix"
	# Read string to replace from template up above for use later
	string_to_replace=$(printf '%s' "$logo_easteregg" | sed -n '21p')
	# Set total logo width (this is done manually because wc -c miscounts special characters such as braille glyphs)
	logo_width=29
	# Do not use more than 1 glyph for this
	bufferspace="⠀"

	# We are not compatible with pure POSIX shell, so arrays are fine
	# Set up arrays containing moves by length (3 being the moves with the shortest name)
	# Fun fact: Originally, I included only 3 and 4 letter long moves which ended up being 29 moves total,
	# the same number as columns in the logo. Very satisfying :D
	# For variety's sake, I added a lot more moves to the list, though
	moves3=("Cut" "Fly" "Dig" "Hex")
	moves4=("Gust" "Bind" "Slam" "Wrap" "Leer" "Bite" "Roar" "Sing" "Acid" "Mist" "Surf" "Peck" "Rage" "Haze" "Bide" "Lick" "Smog" "Rest" "Hail" "Wish" "Yawn" "Dive" "Howl" "Soak" "Coil")
	moves5=("Pound" "Stomp" "Growl" "Ember" "Toxic" "Mimic" "Clamp" "Swift" "Glare" "Spore" "Flash" "Slash" "Thief" "Snore" "Curse" "Flail" "Spite" "Charm" "Spark" "Taunt" "Trick" "Block" "Covet" "Roost" "Brine" "Feint" "Pluck" "Fling" "Defog" "Round" "Scald" "Quash" "Snarl" "Belch" "Lunge")
	moves6=("Tackle" "Thrash" "Absorb" "Growth" "Harden" "Sludge" "Bubble" "Splash" "Sketch" "Spikes" "Detect" "Endure" "Return" "Encore" "Crunch" "Uproar" "Facade" "Charge" "Assist" "Grudge" "Snatch" "Tickle" "Bounce" "U-turn" "Bestow" "Powder" "Nuzzle" "Purify" "Doodle" "Pounce")
	moves7=("Pay Day" "Scratch" "Disable" "Psybeam" "Counter" "Thunder" "Fissure" "Psychic" "Agility" "Screech" "Recover" "Barrier" "Reflect" "Amnesia" "Kinesis" "Barrage" "Psywave" "Sharpen" "Protect" "Lock-On" "Outrage" "Rollout" "Swagger" "Attract" "Present" "Pursuit" "Twister" "Beat Up" "Spit Up" "Swallow" "Torment" "Flatter" "Memento" "Ingrain" "Recycle" "Revenge" "Refresh" "Bulk Up" "Gravity" "Payback" "Embargo" "Copycat" "Chatter" "Inferno" "Work Up" "Confide" "Leafage" "Gear Up" "Burn Up" "Teatime" "Shelter" "Tidy Up")
	moves8=("Headbutt" "Ice Beam" "Blizzard" "Low Kick" "Strength" "Hypnosis" "Meditate" "Teleport" "Minimize" "Withdraw" "Egg Bomb" "Struggle" "Reversal" "Mud-Slap" "Icy Wind" "Megahorn" "Psych Up" "Fake Out" "Endeavor" "Eruption" "Imprison" "Ice Ball" "Astonish" "Overheat" "Mud Shot" "Tailwind" "Me First" "Bug Buzz" "Ice Fang" "Mud Bomb" "Judgment" "Bug Bite" "Aqua Jet" "Psyshock" "Sky Drop" "Bulldoze" "Glaciate" "Ice Burn" "V-create" "Geomancy" "Shore Up" "Instruct" "Zing Zap" "Jaw Lock" "Tar Shot" "Octolock" "Max Ooze" "Decorate" "Life Dew" "Obstruct" "Lash Out" "Coaching" "Axe Kick" "Order Up" "Spin Out" "Psyblade")
	moves9=("Ice Punch" "Vise Grip" "Whirlwind" "Vine Whip" "Mega Kick" "Jump Kick" "Body Slam" "Take Down" "Tail Whip" "Twineedle" "Water Gun" "Fire Spin" "Confusion" "Metronome" "Bone Club" "Waterfall" "Constrict" "Transform" "Explosion" "Nightmare" "Aeroblast" "Octazooka" "Foresight" "Bone Rush" "Sandstorm" "Mean Look" "Heal Bell" "Safeguard" "Magnitude" "Iron Tail" "Synthesis" "Moonlight" "Sunny Day" "Whirlpool" "Stockpile" "Heat Wave" "Follow Me" "Role Play" "Knock Off" "Tail Glow" "Mist Ball" "Mud Sport" "Slack Off" "Rock Tomb" "Sand Tomb" "Calm Mind" "Gyro Ball" "Assurance" "Wring Out" "Aqua Ring" "Aqua Tail" "Seed Bomb" "Air Slash" "X-Scissor" "Power Gem" "Avalanche" "Ice Shard" "Fire Fang" "Discharge" "Gunk Shot" "Iron Head" "Captivate" "Dark Void" "Venoshock" "Low Sweep" "Foul Play" "After You" "Chip Away" "Retaliate" "Drill Run" "Dual Chop" "Psystrike" "Tail Slap" "Hurricane" "Mat Block" "Electrify" "Moonblast" "Boomburst" "Play Nice" "Celebrate" "Hold Back" "Spotlight" "Fire Lash" "Trop Kick" "Zippy Zap" "Baddy Bad" "Max Guard" "Bolt Beak" "Max Flare" "Max Quake" "Snap Trap" "Pyro Ball" "Overdrive" "Flip Turn" "Dire Claw" "Stone Axe" "Silk Trap" "Jet Punch" "Salt Cure" "Aqua Step" "Ruination" "Shed Tail" "Snowscape" "Twin Beam" "Rage Fist")
	moves10=("Mega Punch" "Fire Punch" "Guillotine" "Razor Wind" "Horn Drill" "Supersonic" "Sonic Boom" "Hydro Pump" "Hyper Beam" "Drill Peck" "Submission" "Mega Drain" "Leech Seed" "Razor Leaf" "Solar Beam" "Stun Spore" "Rock Throw" "Earthquake" "Fire Blast" "Skull Bash" "Poison Gas" "Leech Life" "Sky Attack" "Acid Armor" "Crabhammer" "Bonemerang" "Rock Slide" "Hyper Fang" "Conversion" "Tri Attack" "Super Fang" "Substitute" "Spider Web" "Mach Punch" "Scary Face" "Sweet Kiss" "Belly Drum" "Zap Cannon" "Giga Drain" "Milk Drink" "Steel Wing" "Sleep Talk" "Pain Split" "Baton Pass" "Rapid Spin" "Metal Claw" "Cross Chop" "Rain Dance" "Rock Smash" "Superpower" "Magic Coat" "Skill Swap" "Arm Thrust" "Camouflage" "Blaze Kick" "Needle Arm" "Crush Claw" "Blast Burn" "Fake Tears" "Air Cutter" "Sheer Cold" "Aerial Ace" "Leaf Blade" "Rock Blast" "Shock Wave" "Hammer Arm" "Trump Card" "Heal Block" "Power Swap" "Guard Swap" "Punishment" "Worry Seed" "Heart Swap" "Force Palm" "Poison Jab" "Dark Pulse" "Brave Bird" "Switcheroo" "Nasty Plot" "Psycho Cut" "Rock Climb" "Trick Room" "Lava Plume" "Leaf Storm" "Power Whip" "Stone Edge" "Grass Knot" "Heal Order" "Head Smash" "Double Hit" "Crush Grip" "Seed Flare" "Hone Claws" "Wide Guard" "Autotomize" "Magic Room" "Smack Down" "Heavy Slam" "Acid Spray" "Clear Smog" "Heal Pulse" "Shift Gear" "Incinerate" "Acrobatics" "Electroweb" "Horn Leech" "Heat Crash" "Night Daze" "Gear Grind" "Relic Song" "Blue Flare" "Rototiller" "Sticky Web" "Noble Roar" "Ion Deluge" "Freeze-Dry" "Play Rough" "Fairy Wind" "Fairy Lock" "Happy Hour" "Hold Hands" "Bloom Doom" "Ice Hammer" "Power Trip" "Speed Swap" "Beak Blast" "Shell Trap" "Accelerock" "Mind Blown" "Pika Papow" "Buzzy Buzz" "Sappy Seed" "Snipe Shot" "No Retreat" "Max Strike" "Max Geyser" "Body Press" "Aura Wheel" "Apple Acid" "Grav Apple" "Eternabeam" "Steel Beam" "Scale Shot" "Wave Crash" "Esper Wing" "Take Heart" "Tera Blast" "Torch Song" "Trailblaze" "Blood Moon" "Syrup Bomb" "Ivy Cudgel" "Hard Press" "Upper Hand")
	moves11=("Karate Chop" "Double Slap" "Comet Punch" "Wing Attack" "Double Kick" "Sand Attack" "Horn Attack" "Fury Attack" "Double-Edge" "Pin Missile" "Bubble Beam" "Aurora Beam" "Petal Dance" "String Shot" "Dragon Rage" "Thunderbolt" "Night Shade" "Double Team" "Smokescreen" "Confuse Ray" "Mirror Move" "Soft-Boiled" "Dream Eater" "Lovely Kiss" "Dizzy Punch" "Fury Swipes" "Triple Kick" "Mind Reader" "Flame Wheel" "Powder Snow" "Sludge Bomb" "Perish Song" "False Swipe" "Fury Cutter" "Frustration" "Sacred Fire" "Sweet Scent" "Vital Throw" "Morning Sun" "Mirror Coat" "Shadow Ball" "Will-O-Wisp" "Focus Punch" "Brick Break" "Hyper Voice" "Poison Fang" "Meteor Mash" "Odor Sleuth" "Silver Wind" "Metal Sound" "Water Spout" "Signal Beam" "Muddy Water" "Bullet Seed" "Dragon Claw" "Poison Tail" "Volt Tackle" "Water Sport" "Water Pulse" "Doom Desire" "Miracle Eye" "Acupressure" "Metal Burst" "Power Trick" "Gastro Acid" "Lucky Chant" "Last Resort" "Magnet Rise" "Flare Blitz" "Aura Sphere" "Rock Polish" "Night Slash" "Dragon Rush" "Drain Punch" "Vacuum Wave" "Focus Blast" "Energy Ball" "Earth Power" "Giga Impact" "Shadow Claw" "Mirror Shot" "Magnet Bomb" "Charge Beam" "Wood Hammer" "Lunar Dance" "Magma Storm" "Guard Split" "Power Split" "Wonder Room" "Rage Powder" "Telekinesis" "Storm Throw" "Flame Burst" "Sludge Wave" "Simple Beam" "Entrainment" "Quick Guard" "Ally Switch" "Shell Smash" "Fire Pledge" "Volt Switch" "Dragon Tail" "Wild Charge" "Heart Stamp" "Razor Shell" "Steamroller" "Head Charge" "Bolt Strike" "Fiery Dance" "Fusion Bolt" "Topsy-Turvy" "Infestation" "Solar Blade" "Laser Focus" "Throat Chop" "Pollen Puff" "Anchor Shot" "Aurora Veil" "Shadow Bone" "Liquidation" "Floaty Fall" "Glitzy Glow" "Max Knuckle" "Branch Poke" "Meteor Beam" "Poltergeist" "Triple Axel" "Wicked Blow" "Fiery Wrath" "Eerie Spell" "Power Shift" "Raging Fury" "Chloroblast" "Ice Spinner" "Glaive Rush" "Triple Dive" "Mortal Spin" "Fillet Away" "Raging Bull" "Hydro Steam" "Hyper Drill" "Comeuppance" "Aqua Cutter" "Fickle Beam" "Thunderclap" "Nihil Light")
	moves12=("Swords Dance" "Rolling Kick" "Poison Sting" "Flamethrower" "Seismic Toss" "Sleep Powder" "Thunder Wave" "Quick Attack" "Defense Curl" "Light Screen" "Focus Energy" "Spike Cannon" "Conversion 2" "Cotton Spore" "Feint Attack" "Destiny Bond" "Hidden Power" "Future Sight" "Nature Power" "Helping Hand" "Secret Power" "Luster Purge" "Teeter Dance" "Hydro Cannon" "Weather Ball" "Aromatherapy" "Cosmic Power" "Shadow Punch" "Extrasensory" "Sky Uppercut" "Icicle Spear" "Iron Defense" "Frenzy Plant" "Magical Leaf" "Dragon Dance" "Psycho Boost" "Wake-Up Slap" "Healing Wish" "Natural Gift" "Close Combat" "Psycho Shift" "Sucker Punch" "Toxic Spikes" "Dragon Pulse" "Bullet Punch" "Thunder Fang" "Shadow Sneak" "Zen Headbutt" "Flash Cannon" "Draco Meteor" "Rock Wrecker" "Cross Poison" "Stealth Rock" "Attack Order" "Defend Order" "Roar of Time" "Spacial Rend" "Ominous Wind" "Shadow Force" "Quiver Dance" "Synchronoise" "Electro Ball" "Flame Charge" "Echoed Voice" "Stored Power" "Circle Throw" "Reflect Type" "Final Gambit" "Water Pledge" "Grass Pledge" "Struggle Bug" "Frost Breath" "Sacred Sword" "Leaf Tornado" "Cotton Guard" "Searing Shot" "Techno Blast" "Secret Sword" "Freeze Shock" "Icicle Crash" "Fusion Flare" "Flying Press" "Fell Stinger" "Parting Shot" "Spiky Shield" "Venom Drench" "Land's Wrath" "Origin Pulse" "Hydro Vortex" "Catastropika" "Strength Sap" "Toxic Thread" "Smart Strike" "Brutal Swing" "Fleur Cannon" "Tearful Look" "Multi-Attack" "Plasma Fists" "Sizzly Slide" "Freezy Frost" "Stuff Cheeks" "Magic Powder" "Dragon Darts" "Court Change" "Max Phantasm" "Max Starfall" "Max Wyrmwind" "Max Rockfall" "Max Darkness" "Drum Beating" "Spirit Break" "Steel Roller" "Grassy Glide" "Thunder Cage" "Barb Barrage" "Lumina Crash" "Flower Trick" "Make It Rain" "Armor Cannon" "Bitter Blade" "Double Shock" "Electro Shot" "Dragon Cheer" "Temper Flare")

	# Get user name length
	username_length="${#USER}"
	# Maximum user length is 29 - 7 - 3 (shortest move length) = 19
	# Cut user name to 19 characters if it is longer
	username=$(printf '%s' "$USER" | cut -c1-19)

	# Set up possible moves
	# Since we cut down the user name to 19 characters, moves with the length 3 are always possible
	moves=()
	moves+=("${moves3[@]}")

	# If the username allows for longer moves, add those as well
	if [ $username_length -le 18 ]; then
		moves+=("${moves4[@]}")
	fi
	if [ $username_length -le 17 ]; then
		moves+=("${moves5[@]}")
	fi
	if [ $username_length -le 16 ]; then
		moves+=("${moves6[@]}")
	fi
	if [ $username_length -le 15 ]; then
		moves+=("${moves7[@]}")
	fi
	if [ $username_length -le 14 ]; then
		moves+=("${moves8[@]}")
	fi
	if [ $username_length -le 13 ]; then
		moves+=("${moves9[@]}")
	fi
	if [ $username_length -le 12 ]; then
		moves+=("${moves10[@]}")
	fi
	if [ $username_length -le 11 ]; then
		moves+=("${moves11[@]}")
	fi
	if [ $username_length -le 10 ]; then
		moves+=("${moves12[@]}")
	fi

	# Select one of the moves at random
	chosen_move="${moves[$(($RANDOM % ${#moves[@]}))]}"

	# Make a command string with our chosen move
	commandString=", use $chosen_move!"

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
	printf '%s' "$logo_easteregg" >$file_easteregg

	# Call hyfetch or fastfetch with the easter egg logo only
	if [ ! -z $1 ] && [ $1 = "skip-colour" ]; then
		eval "fastfetch --logo $file_easteregg"
	else
		eval "hyfetch --ascii-file $file_easteregg"
	fi
	rm -f $file_easteregg
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
