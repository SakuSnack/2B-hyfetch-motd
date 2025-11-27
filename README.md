# 2B-hyfetch-motd
Get greeted by a proud 2B when you open your terminal

### About
This is a script to run hyfetch with a custom logo, randomly chosen from a pool of installed logos.
By default, the cute 2B logos I created this for are included.

![Screenshot](/res/screenshot-1.png?raw=true "Screenshot")


### Requirements
You need to have ``hyfetch`` and one of it's supported backends, such as ``fastfetch`` installed.
Fastfetch config is not included in this repo.

### How to install
Run the following in your terminal:
```
git clone https://github.com/SakuSnack/2B-hyfetch-motd
cd 2B-hyfetch-motd
chmod +x install.sh
./install.sh
```

To update to the latest version and install all new logos, if you already installed on 2025-11-26 or later, simply run 
```
thats-so-random.sh update
```

The script will be installed to ``~/.local/bin``

The logos will be installed to ``~/.local/share/thats-so-random/logos``

You can add your own custom logos to this folder and the script will include them in the random selection.


### How to use
Add ``thats-so-random.sh`` to your shell init file.
Optionally use ``thats-so-random.sh skip-colour`` to skip colourizing the logo

Running ``thats-so-random.sh help`` will also display all options again.

For bash: ``~/.bashrc``; for zsh: ``~/.zshrc``; for fish: ``~/.config/fish/config.fish``

It may work with other shells, but I have only tested these three.

You can also run ``thats-so-random.sh`` directly in your terminal, if you wish.
