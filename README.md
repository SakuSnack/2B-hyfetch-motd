# 2B-hyfetch-motd
Get greeted by a proud 2B when you open your terminal

### About
This is a script to run hyfetch with a custom logo, randomly chosen from a pool of installed logos.
By default, the cute 2B logos I created this for are included.

### Requirements
You need to have ``hyfetch`` and one of it's supported backends, such as ``fastfetch`` installed.


### How to install
Run the following in your terminal:
```
git clone https://github.com/SakuSnack/2B-hyfetch-motd
cd 2B-hyfetch-motd
chmod +x install.sh
./install.sh
```
The script will be installed to ``~/.local/bin``

The logos will be installed to ``~/.local/share/thats-so-random/logos``

You can add your own custom logos to this folder and the script will include them in the random selection.


### How to use
Add ``thats-so-random.sh`` to your shell init file.

For bash: ``~/.bashrc``; for zsh: ``~/.zshrc``; for fish: ``~/.config/fish/config.fish``

It may work with other shells, but I have only tested these three.

You can also run ``thats-so-random.sh`` directly in your terminal, if you wish.
