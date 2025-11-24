#shellcheck disable=SC2086

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
cp thats-so-random.sh $INSTALL_BIN/ || exit 1
chmod +x $INSTALL_BIN/thats-so-random.sh || exit 1

echo "Installing logos to $INSTALL_DATA/thats-so-random/logos"
mkdir -p $INSTALL_DATA/thats-so-random/logos || exit 1
cp thats-so-random-logos/* $INSTALL_DATA/thats-so-random/logos/ || exit 1

echo ""
echo "Installation successful. Please add ${bold}thats-so-random.sh${normal} to your shell init file."
echo "Bash: ~/.bashrc    zsh: ~/.zshrc    fish: ~/.config/fish/config.fish"
echo ""
echo "For zsh, add it after ${bold}export PATH=\$HOME/.local/bin:\$PATH${normal}"
echo "If you use a powerlevel9k or powerlevel20k instant prompt, add ${bold}thats-so-random${normal} before sourcing the instant prompt."
echo ""
echo "If you have not configured hyfetch yet, please run ${bold}hyfetch --config${normal} now."
