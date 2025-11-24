#shellcheck disable=SC2004,SC2086,SC2231

dataLocation=""
if [ -z $XDG_DATA_HOME ]; then
	dataLocation="$HOME/.local/share/thats-so-random"
else
	dataLocation="$XDG_DATA_HOME/thats-so-random"
fi
logoLocation="$dataLocation/logos"

randomFetch=()
for logo in $logoLocation/*; do {
	randomFetch+=("hyfetch --ascii-file $logo")
}; done

eval "${randomFetch[$(($RANDOM % ${#randomFetch[@]}))]}"
