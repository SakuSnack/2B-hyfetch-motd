#shellcheck disable=SC2004,SC2086,SC2231

dataLocation=""
if [ -z $XDG_DATA_HOME ]; then
	dataLocation="$HOME/.local/share/thats-so-random"
else
	dataLocation="$XDG_DATA_HOME/thats-so-random"
fi
logoLocation="$dataLocation/logos"

if [ ! -z $1 ] && [ $1 = "help" ]; then
	{
		echo "$0 options:"
		echo "help: display this help text"
		echo "update: Fetch the latest version from github"
		echo "skip-colour: skip colourizing the logo (uses your fastfetch colour instead)"
		echo ""
		exit 0
	}
fi

if [ ! -z $1 ] && [ $1 = "update" ]; then
	{
		mkdir -p $dataLocation
		cd $dataLocation
		git clone https://github.com/SakuSnack/2B-hyfetch-motd || exit 1
		cd 2B-hyfetch-motd
		chmod +x install.sh
		THATS_SO_RANDOM_UPDATE=1 ./install.sh
		unset THATS_SO_RANDOM_UPDATE
		cd ..
		rm -rf 2B-hyfetch-motd
		exit 0
	}
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
