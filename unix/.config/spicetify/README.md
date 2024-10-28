# Spicetify guide

## Installation

### Setup spicetify locally

Install client: `brew install spicetify-cli`
Go to config folder: `cd $HOME/.config/ && mkdir spicetify && cd spicetify`
Generate config file in cwd: `spicetify`
Initialise spicetify: `spicetify backup apply enable-devtools`
Apply spicetify: `spicetify update`

### Install spicetify [ marketplace ](https://github.com/spicetify/marketplace/wiki/Installation)

Download latest [release](https://github.com/spicetify/marketplace/releases)
Unzip and move the whole folder into`$HOME/.config/spicetify/CustomApps`
Set basic theme:

```sh
mkdir -p $HOME/.config/spicetify/Themes/marketplace/
echo "[marketplace]" > $HOME/.config/spicetify/Themes/marketplace/color.ini
spicetify config inject_css 1 replace_colors 1 current_theme marketplace
spicetify config custom_apps marketplace
spicetify apply
```

### Follow themes

[Spicetify themes](https://spicetify.app/docs/advanced-usage/themes)

### Apply config for [Bloom](https://github.com/nimsandu/spicetify-bloom)

```sh
spicetify config current_theme <pkg in /Themes> color_scheme <scheme name>
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1 inject_theme_js 1
spicetify apply
```

## Additional Installations from marketplace

- Trash Bin
- Shuffle+
- Loopy Loop
- Keyboard shortcut
- Beautiful lyrics
- Spicetify-hide-podcasts
- Rounded images
- Rounded Now playing bar
- Lucid

## Reference

- [Spicetify](https://spicetify.app/docs/advanced-usage/installation#homebrew-or-linuxbrew)
